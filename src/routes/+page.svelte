<script>
  import SystemDiagram from '$lib/components/SystemDiagram.svelte';
  import PinSwap from '$lib/components/PinSwap.svelte';
</script>

<svelte:head><title>Sorter V2 - Wire harness</title></svelte:head>

<h1>Wire harness</h1>
<p class="sub">Working documentation for review.</p>
<p class="meta">24V power distribution from the PSU, plus everything connected to basically board v1.3. Wire IDs match the schedule tables. Open items in section 7.</p>

<div class="warn">This is just what Spencer has as of July 12th 2026. This is not the final state.</div>

<h2>1 &nbsp; Power supply</h2>
<dl class="spec">
  <dt>Model</dt><dd>MEAN WELL LRS-350-24</dd>
  <dt>Output</dt><dd>24V, 14.6A, 350.4W, single output</dd>
  <dt>Enclosure</dt><dd>Custom 3D-printed box, fused AC input</dd>
  <dt>DC outputs</dt><dd>6 &times; female DC jack, each a 4 in wire with 2 &times; fork / screw terminals onto the PSU output</dd>
</dl>

<h2>2 &nbsp; Component layout</h2>
<figure>
  <img class="layout" src="/component-layout.png" alt="Top-down physical component layout on the machine" />
  <figcaption>Physical placement on the machine (top-down): PSU, Orange Pi, basically board v1.3, USB hub, Pico, the chute stepper and its limit switch, and the ribbon run.</figcaption>
</figure>

<h2>3 &nbsp; Interconnect diagram</h2>
<SystemDiagram />

<h3>3.1 &nbsp; Stepper polarity</h3>
<div class="note flag">
  Source of truth is the basically board v1.3 pinout. The channel cable lands on the motor's <b>6-pin</b> JST-PH socket, so board pins <code>1&middot;2&middot;3&middot;4</code> go to motor pins <code>1&middot;4&middot;3&middot;6</code> and motor pins 2 and 5 stay empty. Nets match end to end; the positions do not, so it is not a straight-through cable. Check the coils with a multimeter before plugging a motor in.
</div>
<p class="meta">Full basically board v1.3 pinout (J23-J40), connector-to-connector mapping, and connector reference: <a href="/steppers">stepper connectors</a>.</p>
<PinSwap />

<h2>4 &nbsp; Wire schedule</h2>

<h3>4.1 &nbsp; PSU assembly (enclosure)</h3>
<p class="meta">The PSU box is an assembly: the MEAN WELL LRS-350-24, a fused mains inlet switch, and 6 DC output jacks, in a 3D-printed enclosure. These are the wires inside that box. Enclosure CAD: <a href="https://cad.onshape.com/documents/ff3546ceb03f5fc907e6ed4c/v/f06d891a27f145d952ee5678/e/b9f80b00e4dd34407e23b560" target="_blank" rel="noopener">Onshape</a>.</p>
<table>
  <thead><tr><th>Segment</th><th>From</th><th>To</th><th>Cond.</th><th>Length</th><th>Gauge</th></tr></thead>
  <tbody>
    <tr><td>Mains inlet</td><td>Fused inlet switch (3Dman, 10A fuse)</td><td>PSU AC input (L / N / earth)</td><td>3</td><td>-</td><td>18 AWG</td></tr>
    <tr><td>DC output jacks (&times;6)</td><td>PSU 24V output, 2&times; fork/screw terminal</td><td>Female DC jack</td><td>2</td><td>4 in</td><td>TBD</td></tr>
  </tbody>
</table>

<h3>4.2 &nbsp; Loads on the PSU (24V)</h3>
<p class="meta">A male DC barrel plug on each wire mates one of the PSU output jacks (J1-J6).</p>
<table>
  <thead><tr><th>ID</th><th>Load</th><th>From</th><th>To</th><th>Cond.</th><th>Length</th><th>Gauge</th></tr></thead>
  <tbody>
    <tr><td class="id">W1</td><td>basically board v1.3</td><td>PSU J1, male DC</td><td>JST-XH female (board 24V in)</td><td>2</td><td>36 in <span class="flag">too long</span></td><td>TBD</td></tr>
    <tr><td class="id">W2</td><td>Waveshare 4-port USB hub, 24V</td><td>PSU J2, male DC</td><td>Male DC (hub)</td><td>2</td><td>12 in</td><td>TBD</td></tr>
    <tr><td class="id">W3</td><td>Orange Pi 5</td><td>PSU J3, male DC</td><td>24V-5V USB-C buck</td><td>2</td><td>6 in</td><td>TBD</td></tr>
    <tr><td class="id">W4</td><td>Fan, 24V 40mm</td><td>PSU J4, male DC</td><td>Fan</td><td>2</td><td>36 in <span class="flag">too long</span></td><td>TBD</td></tr>
    <tr><td class="id">W5</td><td>Fan, 24V 40mm</td><td>PSU J5, male DC</td><td>Fan</td><td>2</td><td>36 in <span class="flag">too long</span></td><td>TBD</td></tr>
  </tbody>
</table>
<p class="meta">J6 output is unassigned. Confirm spare or missing load.</p>

<h3>4.3 &nbsp; LEDs (from basically board v1.3)</h3>
<p class="meta">Each LED drop is two segments: a 2x1 dupont feed from the board to a female DC jack (the unplug point), then a 6 in male-DC pigtail into the module.</p>
<table>
  <thead><tr><th>ID</th><th>Segment</th><th>From</th><th>To</th><th>Cond.</th><th>Length</th></tr></thead>
  <tbody>
    <tr><td class="id">L1</td><td>COB board feed</td><td>2x1 dupont (board)</td><td>Female DC jack</td><td>2</td><td>36 in</td></tr>
    <tr><td class="id">L1p</td><td>COB board pigtail</td><td>Male DC jack</td><td>COB board</td><td>2</td><td>6 in</td></tr>
    <tr><td class="id">L2</td><td>COB board feed</td><td>2x1 dupont (board)</td><td>Female DC jack</td><td>2</td><td>36 in</td></tr>
    <tr><td class="id">L2p</td><td>COB board pigtail</td><td>Male DC jack</td><td>COB board</td><td>2</td><td>6 in</td></tr>
    <tr><td class="id">L3</td><td>LED strip feed</td><td>2x1 dupont (board)</td><td>Female DC jack</td><td>2</td><td>36 in</td></tr>
    <tr><td class="id">L3p</td><td>LED strip pigtail</td><td>Male DC jack</td><td>LED strip (6000K)</td><td>2</td><td>6 in</td></tr>
  </tbody>
</table>
<div class="note">LED strip for the classification channel is <b>6000K</b>. Length: 2&times; revolutions around the classification channel inner tube = 108.400 mm &times; 2 &approx; 220 mm.</div>

<h3>4.4 &nbsp; Sensors &amp; steppers (from basically board v1.3)</h3>
<table>
  <thead><tr><th>ID</th><th>Segment</th><th>From</th><th>To</th><th>Cond.</th><th>Length</th></tr></thead>
  <tbody>
    <tr><td class="id">LIM</td><td>Limit switch</td><td>basically board v1.3, 2x1 dupont</td><td>Limit switch</td><td>2</td><td>24 in</td></tr>
    <tr><td class="id">S1-4</td><td>Stepper, channels 1-4 (&times;4)</td><td>basically board v1.3, 4x1 dupont</td><td>Stepper, JST-PH 6-pin (board 1&middot;2&middot;3&middot;4 &rarr; motor 1&middot;4&middot;3&middot;6)</td><td>4</td><td>1 m</td></tr>
    <tr><td class="id">CH</td><td>Chute stepper</td><td>basically board v1.3, 4x1 dupont</td><td>Chute stepper - flying leads, need prep</td><td>4</td><td>40 in</td></tr>
  </tbody>
</table>
<div class="warn"><b>Recommended change:</b> We should switch all the stepper wires from 4x1 dupont to JST-PH 4-pin to help ensure a better connection.</div>

<h3>4.5 &nbsp; Servo adapter (ribbon)</h3>
<table>
  <thead><tr><th>ID</th><th>Segment</th><th>From</th><th>To</th><th>Cond.</th><th>Length</th></tr></thead>
  <tbody>
    <tr><td class="id">RIB</td><td>Ribbon cable</td><td>basically board v1.3, 16-pin IDC (FC)</td><td>First servo adapter board, 16-pin IDC (FC)</td><td>16</td><td>1 m</td></tr>
  </tbody>
</table>
<figure style="max-width:280px">
  <img src="/ribbon.jpg" alt="16-pin IDC ribbon cable" style="width:100%;border:1px solid var(--line);border-radius:4px" />
  <figcaption>uxcell 16-pin IDC flat ribbon, FC/FC, 2.54 mm pitch, 1 m, gray.</figcaption>
</figure>

<h2>5 &nbsp; Parts</h2>
<ul class="tight">
  <li>MEAN WELL LRS-350-24, 350.4W 24V 14.6A single output &nbsp;&middot;&nbsp; <a href="https://www.amazon.com/dp/B013ETVO12">link</a></li>
  <li>3Dman fused mains inlet switch, 15A 250V rocker + 10A fuse, 3-pin, 18 AWG &nbsp;&middot;&nbsp; <a href="https://www.amazon.com/dp/B07RQV2NPN">link</a></li>
  <li>DC 12V/24V to 5V USB-C buck converter, 5A 25W, powers Orange Pi 5 &nbsp;&middot;&nbsp; <a href="https://www.amazon.com/dp/B0FV3P6KLS">link</a></li>
  <li>WINSINN 40mm 24V fan (4010), ships XH2.54-2PIN, re-terminated to male DC jack &nbsp;&middot;&nbsp; <a href="https://www.amazon.com/dp/B0757RPCN9">link</a></li>
  <li>uxcell 16-pin IDC flat ribbon cable, FC/FC, 2.54 mm, 1 m, gray &nbsp;&middot;&nbsp; <a href="https://www.amazon.com/dp/B07S2W4N9T">link</a></li>
  <li>Waveshare 4-port USB hub, 24V model</li>
  <li>Orange Pi 5</li>
</ul>

<h2>6 &nbsp; Connector / terminal types</h2>
<ul class="tight">
  <li>Fused IEC inlet switch, 3-pin (L / N / earth): PSU mains inlet</li>
  <li>Fork / screw terminal: PSU 24V output to the DC jacks</li>
  <li>DC barrel jack, female: PSU outputs, LED unplug junctions</li>
  <li>DC barrel jack, male: load pigtails, LED pigtails</li>
  <li>JST-XH female: basically board v1.3 24V input (W1)</li>
  <li>2x1 dupont (2.54 mm): LED drops (L1-L3), limit switch</li>
  <li>4x1 dupont (2.54 mm): steppers, on the board pin headers J24, J28, J32, J36, J40</li>
  <li>16-pin IDC (FC), 2.54 mm: ribbon to first servo adapter board</li>
</ul>

<h2>7 &nbsp; Open items</h2>
<ol>
  <li><b>Lengths.</b> W1, W4, W5 are 36 in and longer than necessary. Pick final lengths and cut.</li>
  <li><b>Board 24V input connector.</b> Confirm it is JST-XH (vs JST-VH) and its exact pitch.</li>
  <li><b>Missing LED wire(s).</b> Re-count the LED drops against the actual LEDs.</li>
  <li><b>J6 (6th PSU output).</b> 5 loads on 6 jacks. Confirm the spare or the missing load.</li>
  <li><b>Gauge per segment.</b> Current draw per load is needed to spec gauge.</li>
  <li><b>SKU reduction.</b> Once gauges are known, standardize on as few gauges and connector types as possible.</li>
</ol>
<p class="meta">The <a href="/order">order spec</a> page fills these in with guesses (marked as guesses) for ordering purposes; nothing there is confirmed.</p>
