<svelte:head><title>Sorter V2 - Harness order spec</title></svelte:head>

<h1>Harness order spec</h1>
<p class="sub">Order-ready cable build list for a custom harness vendor.</p>
<p class="meta">Every TBD from the <a href="/">wire harness</a> page is filled in with a stated guess. Lengths are kept deliberately long; if a cable comes back a little wrong we iterate. IDs match the wire schedule.</p>

<div class="warn"><b>Guesses inside.</b> Gauges, connector part numbers, and the chute stepper length are engineering guesses, not measurements. They are conservative and safe to order against. Verify list in section 7.</div>

<h2>1 &nbsp; Global spec</h2>
<dl class="spec">
  <dt>Wire</dt><dd>UL1007 stranded, 300V, tinned copper</dd>
  <dt>Gauges</dt><dd>18 AWG (PSU box internals) &middot; 22 AWG (all barrel-plug 24V runs, LED feeds, limit switch) &middot; 24 AWG (stepper cables &mdash; JST-PH contact limit)</dd>
  <dt>Colors</dt><dd>Red = +24V, black = GND on all 2-conductor power cables. Steppers: see pin maps, section 3 &mdash; the channel cables are BU/GN/RD/BK on board pins 1-4.</dd>
  <dt>Barrel jacks</dt><dd>5.5 mm OD &times; 2.1 mm ID, center-positive, rated &ge;5 A</dd>
  <dt>Length tolerance</dt><dd>&plusmn;10 mm (&plusmn;25 mm fine on anything &ge;36 in)</dd>
  <dt>Bare ends</dt><dd>Strip 5 mm, tin</dd>
  <dt>Labeling</dt><dd>Each cable labeled with its ID (W1, S1&hellip;) on a flag label near end A</dd>
  <dt>Order quantity</dt><dd>2 full sets recommended &mdash; lengths are guesses, spares are cheap</dd>
</dl>

<h2>2 &nbsp; Cable build list</h2>
<p class="meta">One row = one buildable cable SKU. End A is the PSU/board side. "Bare" ends are for parts the vendor cannot terminate (section 4).</p>
<table>
  <thead><tr><th>ID</th><th>Qty</th><th>Gauge</th><th>Length</th><th>Cond.</th><th>End A</th><th>End B</th><th>Notes</th></tr></thead>
  <tbody>
    <tr><td class="id">PSU-J</td><td>6</td><td>18 AWG</td><td>4 in</td><td>2</td><td>2&times; insulated fork terminal (PSU output screws)</td><td>Panel-mount female DC jack 5.5&times;2.1</td><td>Lives inside the PSU box</td></tr>
    <tr><td class="id">W1</td><td>1</td><td>22 AWG</td><td>36 in</td><td>2</td><td>Male DC plug 5.5&times;2.1</td><td>JST XHP-2 + SXH-001T contacts</td><td>Board 24V in. Pin 1 = +24V <span class="flag">verify silkscreen</span></td></tr>
    <tr><td class="id">W2</td><td>1</td><td>22 AWG</td><td>12 in</td><td>2</td><td>Male DC plug 5.5&times;2.1</td><td>Male DC plug 5.5&times;2.1</td><td>USB hub. Double-male, center-positive both ends <span class="flag">verify hub jack size</span></td></tr>
    <tr><td class="id">W3</td><td>1</td><td>22 AWG</td><td>6 in</td><td>2</td><td>Male DC plug 5.5&times;2.1</td><td>Bare, tinned</td><td>Splice to USB-C buck input leads</td></tr>
    <tr><td class="id">W4, W5</td><td>2</td><td>22 AWG</td><td>36 in</td><td>2</td><td>Male DC plug 5.5&times;2.1</td><td>Bare, tinned</td><td>Splice to fan leads (cut off the fan's XH plug)</td></tr>
    <tr><td class="id">L1-L3</td><td>3</td><td>22 AWG</td><td>36 in</td><td>2</td><td>Dupont 1x2 female (2.54 mm)</td><td>Female inline DC jack 5.5&times;2.1</td><td>LED feed from board to unplug point</td></tr>
    <tr><td class="id">L1p, L2p</td><td>2</td><td>22 AWG</td><td>6 in</td><td>2</td><td>Male DC plug 5.5&times;2.1</td><td>Bare, tinned</td><td>Solder to COB board pads</td></tr>
    <tr><td class="id">L3p</td><td>1</td><td>22 AWG</td><td>6 in</td><td>2</td><td>Male DC plug 5.5&times;2.1</td><td>Bare, tinned</td><td>Solder to LED strip (6000K) pads</td></tr>
    <tr><td class="id">LIM</td><td>1</td><td>22 AWG</td><td>24 in</td><td>2</td><td>Dupont 1x2 female (2.54 mm)</td><td>Bare, tinned</td><td>Solder to limit switch lugs</td></tr>
    <tr><td class="id">S1-S4</td><td>4</td><td>24 AWG</td><td>1 m</td><td>4</td><td>JST PHR-4 + SPH-002T contacts</td><td>JST PHR-6 + SPH-002T contacts (4 of 6 positions)</td><td>Crossover cable &mdash; pin map 3.2. Plugs the motor's 6-pin PH socket. PVC sleeving over the bundle</td></tr>
    <tr><td class="id">CH</td><td>1</td><td>24 AWG</td><td>40 in <span class="flag">guess</span></td><td>4</td><td>JST PHR-4 + SPH-002T contacts</td><td>Bare, tinned, 4 leads labeled 1-4</td><td>Splice to chute stepper flying leads &mdash; pin map 3.3</td></tr>
  </tbody>
</table>
<div class="note">
  <b>Steppers are JST-PH at both ends.</b> This spec adopts the recommended change: stepper cables plug the board's <b>JST-PH 4-pin</b> jacks (J23, J27, J31, J35, J39) instead of dupont on the parallel pin headers, and the channel cables land on the motor's <b>JST-PH 6-pin</b> socket. PH contacts accept 24-28 AWG, hence 24 AWG on S1-S4 and CH. The mains inlet wiring (18 AWG, 3-cond.) comes pre-made on the 3Dman inlet switch and is not part of this order. The 16-pin IDC ribbon is an off-the-shelf uxcell part &mdash; buy, don't build.
</div>

<h2>3 &nbsp; Pin maps</h2>

<h3>3.1 &nbsp; 2-conductor power (PSU-J, W1-W5, L1-L3, pigtails)</h3>
<p>Barrel jacks and plugs: center/tip = +24V (red), sleeve = GND (black). W1 board end: XH pin 1 = +24V, pin 2 = GND &mdash; <span class="flag">verify against board silkscreen before ordering</span>. LED feed dupont: pin 1 = +24V, pin 2 = GND, same caveat.</p>

<h3>3.2 &nbsp; Channel stepper cable S1-S4 (crossover)</h3>
<p>4-pin PHR-4 at the board, 6-pin PHR-6 at the motor with only 4 positions populated. The nets match end to end but the positions do not, which is where the crossover lives.</p>
<table style="max-width:560px">
  <thead><tr><th>Board PH pin</th><th>Net</th><th>Motor PH pin</th><th>Color</th></tr></thead>
  <tbody>
    <tr><td>1</td><td>A2</td><td>1</td><td>blue</td></tr>
    <tr><td>2</td><td>A1</td><td>4</td><td>green</td></tr>
    <tr><td>3</td><td>B1</td><td>3</td><td>red</td></tr>
    <tr><td>4</td><td>B2</td><td>6</td><td>black</td></tr>
  </tbody>
</table>
<div class="note flag"><b>For the vendor, explicitly:</b> this is NOT a straight-through cable, and the two ends have different pin counts. Board 1 &rarr; motor 1, board 2 &rarr; motor 4, board 3 &rarr; motor 3, board 4 &rarr; motor 6. Motor positions 2 and 5 stay empty &mdash; no contact, no wire.</div>
<p class="meta">Motor connector pinout is <code>A2 C1 B1 A1 C2 B2</code> across pins 1-6. Check the coils with a multimeter before plugging a motor in.</p>

<h3>3.3 &nbsp; Chute stepper cable CH (straight, bare end)</h3>
<table style="max-width:520px">
  <thead><tr><th>Board PH pin</th><th>Net</th><th>Coil</th><th>Color</th></tr></thead>
  <tbody>
    <tr><td>1</td><td>A2</td><td>A</td><td>black</td></tr>
    <tr><td>2</td><td>A1</td><td>A</td><td>green</td></tr>
    <tr><td>3</td><td>B1</td><td>B</td><td>red</td></tr>
    <tr><td>4</td><td>B2</td><td>B</td><td>blue</td></tr>
  </tbody>
</table>
<p class="meta">Straight-through, coil pairs = 1-2 and 3-4. Identify the motor's coil pairs with a multimeter (a coil reads a few ohms, across coils reads open) before splicing. Swapping within a coil only flips direction.</p>

<h3>3.4 &nbsp; Drawings (WireViz)</h3>
<p class="meta">Rendered harness drawings, BOMs, downloads, and the full supplier package live on the <a href="/wireviz">WireViz</a> page. Every guessed value is marked <b>GUESS</b> in the drawings themselves.</p>

<h2>4 &nbsp; Ends the vendor can't terminate</h2>
<p>Some parts come with their own fixed leads or solder pads, so the harness can't fully land on them. Those cables are ordered with one end bare and tinned, and joined on the machine:</p>
<ul class="tight">
  <li><b>24V&rarr;5V USB-C buck</b> (W3): converter has fixed input leads &mdash; splice.</li>
  <li><b>40mm fans</b> (W4, W5): ship with their own XH-terminated lead &mdash; cut the plug off, splice.</li>
  <li><b>Chute stepper</b> (CH): flying leads out of the motor &mdash; splice.</li>
  <li><b>COB boards / LED strip</b> (L1p-L3p): solder pads &mdash; solder direct.</li>
  <li><b>Limit switch</b> (LIM): solder lugs &mdash; solder direct.</li>
</ul>
<div class="note"><b>Splice spec:</b> solder splice + adhesive-lined heat shrink, one sleeve per conductor plus an overall sleeve. No twist-and-tape, no inline lever nuts.</div>

<h2>5 &nbsp; Connector BOM</h2>
<p class="meta">Genuine JST part numbers given where they exist; Chinese-clone equivalents of all of these are fine for a vendor quote.</p>
<table>
  <thead><tr><th>Connector</th><th>Housing</th><th>Contacts</th><th>Used on</th></tr></thead>
  <tbody>
    <tr><td>JST XH 2-pin</td><td>XHP-2</td><td>SXH-001T-P0.6 (22-28 AWG)</td><td>W1 board end</td></tr>
    <tr><td>JST PH 4-pin</td><td>PHR-4</td><td>SPH-002T-P0.5S (24-28 AWG)</td><td>S1-S4, CH board ends</td></tr>
    <tr><td>JST PH 6-pin</td><td>PHR-6</td><td>SPH-002T-P0.5S (24-28 AWG)</td><td>S1-S4 motor end &mdash; 4 of 6 positions populated</td></tr>
    <tr><td>Dupont 1x2 female, 2.54 mm</td><td colspan="2">generic dupont housing + female crimps (any vendor stocks these)</td><td>L1-L3, LIM board ends</td></tr>
    <tr><td>DC barrel male 5.5&times;2.1</td><td colspan="2">moulded plug w/ lead, or field-installable</td><td>W1-W5, L pigtails</td></tr>
    <tr><td>DC barrel female inline 5.5&times;2.1</td><td colspan="2">moulded inline jack</td><td>L1-L3 unplug points</td></tr>
    <tr><td>DC barrel female panel-mount 5.5&times;2.1</td><td colspan="2">panel-mount jack, &ge;5 A</td><td>PSU box outputs J1-J6</td></tr>
    <tr><td>Fork terminal, insulated</td><td colspan="2">22-16 AWG, sized for the LRS-350 output screws (M3.5 &mdash; <span class="flag">verify</span>)</td><td>PSU-J</td></tr>
  </tbody>
</table>

<h2>6 &nbsp; How to order this</h2>
<ul class="tight">
  <li><b>Custom harness vendor</b> (Alibaba "custom cable assembly", or a US quick-turn shop): send them sections 1-3 and 5 as the drawing. Expect MOQ 50-100 pcs per line item from China; small US shops and some AliExpress custom-cable storefronts will do 5-10.</li>
  <li><b>Low volume alternative:</b> buy pre-crimped PH / XH / dupont leads plus housings and assemble. The only labor a vendor saves is crimping.</li>
  <li>The rationale for every guess in this spec: steppers draw &le;1.5 A/phase (24 AWG ok at these lengths), no single barrel-plug load exceeds ~3 A (22 AWG ok), PSU box pigtails carry worst-case single-load current (18 AWG).</li>
</ul>

<h2>7 &nbsp; Guesses to verify before sending</h2>
<ol>
  <li><b>Board 24V input:</b> XH vs VH, and which pin is +24V. If it turns out VH, W1 becomes VHR-2N + SVH-21T-P1.1 contacts and can move up to 18 AWG.</li>
  <li><b>Board input current:</b> XH contacts are rated ~3 A. If all 5 steppers plus LEDs really run through W1 at once, that's tight &mdash; and would suggest the connector is actually VH.</li>
  <li><b>USB hub barrel size:</b> W2 assumes the Waveshare hub jack is 5.5&times;2.1. Could be 5.5&times;2.5.</li>
  <li><b>Chute stepper length:</b> 40 in, originally copied from the channel steppers. Those are now 1 m per the Stepper_Harness spec; the chute cable was left alone and is still a guess.</li>
  <li><b>Motor connector:</b> PHR-6 with pins 2 and 5 unpopulated comes from the Stepper_Harness spec. Check the coils on an actual motor before ordering.</li>
  <li><b>LED drop count:</b> 3 feeds + 3 pigtails, per the schedule. Re-count against the machine.</li>
  <li><b>PSU screw size</b> for the fork terminals (assumed M3.5).</li>
  <li><b>J6</b> stays a spare output.</li>
</ol>
