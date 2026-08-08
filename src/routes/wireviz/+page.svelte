<script>
  const drawings = [
    {
      name: 'power',
      title: '24V power distribution',
      caption:
        'PSU box pigtails PJ1-PJ6 and load cables W1-W5. Dashed arrows = barrel jack/plug mates. J6 is the unassigned spare.'
    },
    {
      name: 'steppers',
      title: 'Stepper cables',
      caption:
        'The S1-S4 crossover cable (the red/green cross mid-cable is the inner-two swap) and the straight-through chute cable to bare labeled leads.'
    },
    {
      name: 'leds',
      title: 'LED drops & limit switch',
      caption:
        'LED feeds L1-L3 to their unplug-point jacks, pigtails L1p-L3p to the COB boards / strip, and the limit switch cable.'
    }
  ];
</script>

<svelte:head><title>Sorter V2 - WireViz</title></svelte:head>

<h1>WireViz drawings &amp; supplier package</h1>
<p class="sub">Rendered harness drawings, BOMs, and everything a cable vendor would ask for.</p>

<div class="warn"><b>Not remotely validated.</b> Nothing on this page has been checked against the physical machine. Gauges, lengths, connector part numbers, and pin orders marked <b>GUESS</b> in the drawings are guesses layered on top of the <a href="/">wire harness</a> notes. Do not send this to a supplier for production &mdash; sample quantities only, after a review pass.</div>

<h2>1 &nbsp; What you'd actually send a supplier</h2>
<p>One zip with everything in it. Attach it to an Alibaba "custom cable assembly" inquiry along with the quantity (it's stated in the cover sheet: 2 sample sets, price breaks at 10 / 50).</p>
<p style="margin:14px 0">
  <a href="/harness/sorter-v2-harness-rfq.zip" download><b>&darr; sorter-v2-harness-rfq.zip</b></a>
  &nbsp;&middot;&nbsp; <span class="meta" style="margin:0">cover sheet + 3 drawings (PDF/PNG/SVG/HTML) + 3 BOMs (TSV) + WireViz YAML sources</span>
</p>
<p>The cover sheet (<a href="/harness/rfq.txt">rfq.txt</a>) pre-answers their standard questions: quantity, wire spec, clone connectors OK, tolerance, labeling, test requirement, and a callout that cable S is a crossover.</p>

<h3>1.1 &nbsp; The maximum a supplier might ask for</h3>
<ul class="tight">
  <li><b>Drawing per cable</b> with pin-to-pin table, lengths, and tolerances &mdash; the PDFs here (they may ask for DWG; PDF is normally accepted).</li>
  <li><b>BOM</b> with connector part numbers or approved equivalents &mdash; the TSVs here; JST MPNs are in the <a href="/order">order spec</a>, clones explicitly allowed.</li>
  <li><b>Wire spec</b>: gauge, UL style (UL1007), colors, RoHS &mdash; cover sheet section 3.</li>
  <li><b>Quantity and target price</b> &mdash; cover sheet section 2. Expect MOQ pushback below ~50 pcs/type; the cover sheet frames the 2 sets as a paid sample run.</li>
  <li><b>Quality/test requirements</b>: IPC/WHMA-A-620 class, continuity, hipot &mdash; cover sheet says hobby grade, 100% continuity, no hipot, no UL cert.</li>
  <li><b>Label and packaging spec</b> &mdash; cover sheet section 6.</li>
  <li><b>Photos or samples of mating hardware</b> for anything ambiguous (the motor's 6-pin PH socket, the board jacks) &mdash; the only thing not in the zip; send phone photos if asked.</li>
</ul>

<h2>2 &nbsp; Drawings</h2>
<p class="meta">Generated with <a href="https://github.com/wireviz/WireViz">WireViz</a> from the YAML in <code>wireviz/</code>. Everything on this page is derived from those three files: edit the YAML, and CI re-renders the drawings, BOMs, PDFs and the supplier zip and commits them back to the branch. Nothing here is edited by hand. To re-render locally, <code>./scripts/build-harness.sh</code>. HTML = drawing + BOM + cut list in one file.</p>

{#each drawings as d}
  <h3>{d.title}</h3>
  <figure>
    <a href={`/harness/${d.name}.png`} target="_blank" rel="noopener"><img class="layout" style="max-width:900px" src={`/harness/${d.name}.png`} alt={`WireViz drawing: ${d.title}`} /></a>
    <figcaption>{d.caption} Click for full size.</figcaption>
  </figure>
  <p class="meta" style="margin-bottom:20px">
    Download:
    <a href={`/harness/${d.name}.pdf`}>PDF</a> &middot;
    <a href={`/harness/${d.name}.png`} download>PNG</a> &middot;
    <a href={`/harness/${d.name}.svg`} download>SVG</a> &middot;
    <a href={`/harness/${d.name}.html`}>HTML (drawing + BOM)</a> &middot;
    <a href={`/harness/${d.name}.bom.tsv`} download>BOM (TSV)</a> &middot;
    <a href={`/harness/${d.name}.yml`} download>YAML source</a>
  </p>
{/each}
