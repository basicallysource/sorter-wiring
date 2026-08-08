#!/usr/bin/env bash
#
# Regenerate everything under static/harness/ from the WireViz sources in
# wireviz/. This is the only way those files should ever be produced: the
# drawings, the BOMs, the PDFs and the supplier zip are all derived, and a
# hand-edit to any of them is silently reverted the next time this runs.
#
#   ./scripts/build-harness.sh
#
# Needs `wireviz` and graphviz's `dot` on PATH. CI installs both; locally,
# `pip install wireviz==0.4.1` and `brew install graphviz`.
#
# Output is byte-for-byte reproducible, which is what lets CI commit only
# when a drawing actually changed rather than on every run:
#
#   - dot's PDF writer stamps a creation time, so SOURCE_DATE_EPOCH below
#     pins it. Without that the three PDFs differ on every single run and
#     every run produces a commit.
#   - zip stores mtimes, so the archive is built by Python with a fixed
#     timestamp and a fixed member order instead of the zip(1) binary.
#
# The version of graphviz IS part of the output: a bump can shift glyph
# positions and rewrite every PNG and SVG. That shows up as one large
# rebaseline commit touching the images and nothing else, which is expected
# and not a sign anything is wrong. WireViz itself is pinned in CI.

set -euo pipefail

cd "$(dirname "$0")/.."

SRC=wireviz
OUT=static/harness

# Arbitrary fixed instant (2023-11-14T22:13:20Z). Only its constancy matters.
export SOURCE_DATE_EPOCH=1700000000

command -v wireviz >/dev/null || { echo "build-harness: wireviz not on PATH" >&2; exit 1; }
command -v dot     >/dev/null || { echo "build-harness: graphviz 'dot' not on PATH" >&2; exit 1; }

mkdir -p "$OUT"

# ghpst = .gv, .html, .png, .svg, .bom.tsv
wireviz "$SRC"/*.yml -f ghpst -o "$OUT"

# The sources ship inside the supplier package, so the copies served next to
# the drawings are the same bytes the drawings were generated from.
cp "$SRC"/*.yml "$OUT"/

for gv in "$OUT"/*.gv; do
  dot -Tpdf "$gv" -o "${gv%.gv}.pdf"
done

# rfq.txt is written by hand and is an input here, not an output.
python3 - "$OUT" <<'PY'
import sys, zipfile
from pathlib import Path

out = Path(sys.argv[1])
drawings = ["power", "steppers", "leds"]

members = ["rfq.txt"]
for d in drawings:
    members += [f"{d}.pdf", f"{d}.png", f"{d}.svg", f"{d}.html", f"{d}.bom.tsv"]
members += [f"{d}.yml" for d in drawings]

missing = [m for m in members if not (out / m).is_file()]
if missing:
    sys.exit("build-harness: missing from %s: %s" % (out, ", ".join(missing)))

# Fixed date_time and a fixed member order: same inputs, same archive bytes.
with zipfile.ZipFile(out / "sorter-v2-harness-rfq.zip", "w", zipfile.ZIP_DEFLATED) as z:
    for name in members:
        info = zipfile.ZipInfo(name, date_time=(2026, 1, 1, 0, 0, 0))
        info.compress_type = zipfile.ZIP_DEFLATED
        info.external_attr = 0o644 << 16
        z.writestr(info, (out / name).read_bytes())
PY

echo "build-harness: regenerated $OUT from $SRC"
