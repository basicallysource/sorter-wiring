<script>
  import StepperPinout from '$lib/components/StepperPinout.svelte';
  import PinSwap from '$lib/components/PinSwap.svelte';
</script>

<svelte:head><title>Sorter V2 - Stepper connectors</title></svelte:head>

<h1>Stepper connectors &amp; polarity</h1>
<p class="sub">basically board v1.3 &middot; stepper outputs</p>
<p class="meta">basically board v1.3 pinout (all five stepper outputs identical), the connector-to-motor mapping, and the connector reference.</p>

<h2>1 &nbsp; basically board v1.3 connector pinout</h2>
<p>Every stepper output connector on <b>basically board v1.3</b> has the same pinout, pin&nbsp;1 &rarr; pin&nbsp;4:</p>
<table style="max-width:360px">
  <thead><tr><th>Pin</th><th>Net</th><th>Coil</th></tr></thead>
  <tbody>
    <tr><td>1</td><td>A2</td><td>coil A</td></tr>
    <tr><td>2</td><td>A1</td><td>coil A</td></tr>
    <tr><td>3</td><td>B1</td><td>coil B</td></tr>
    <tr><td>4</td><td>B2</td><td>coil B</td></tr>
  </tbody>
</table>

<StepperPinout />

<ul>
  <li>Holds for all five <b>JST-PH 4-pin</b> connectors: <code>J23, J27, J31, J35, J39</code>.</li>
  <li>The parallel <b>2.54&nbsp;mm headers</b> next to each are wired identically: <code>J24, J28, J32, J36, J40</code>.</li>
  <li>Pin&nbsp;1 is the roundrect (square-ish) pad on the footprint.</li>
  <li>Straight pass-through of the BigTreeTech TMC2209 module output order: module pins&nbsp;3-6 = A2, A1, B1, B2 &rarr; connector pins&nbsp;1-4.</li>
</ul>

<div class="note">
  <b>Coil rule.</b> Pins 1-2 are one coil (A), pins 3-4 the other (B). Swapping the two wires <i>within</i> a coil only reverses motor direction. Splitting a coil across the 2/3 boundary is what actually breaks operation, so keep each pair together.
</div>

<h2>2 &nbsp; basically board v1.3 &rarr; motor connections</h2>
<p>On the board side the stepper harness uses <b>4x1 dupont</b> housings (2.54&nbsp;mm) on the parallel pin headers. The 4 channel motors take a <b>JST-PH 2.0&nbsp;mm 6-pin</b> connector (PHR-6) at the motor, of which only 4 positions are populated. The chute motor ships as bare flying leads.</p>
<table>
  <thead><tr><th>Stepper</th><th>basically board v1.3 connector</th><th>Motor connector</th><th>Wire length</th><th>Gauge</th><th>Notes</th></tr></thead>
  <tbody>
    <tr>
      <td>Channels 1-4 (&times;4)</td>
      <td>4x1 dupont (2.54&nbsp;mm) on pin headers J24 / J28 / J32 / J36</td>
      <td>JST-PH 2.0&nbsp;mm, 6-pin (PHR-6) &mdash; pins 2 and 5 unpopulated</td>
      <td>1 m</td>
      <td>24 AWG</td>
      <td>Board 1&middot;2&middot;3&middot;4 &rarr; motor 1&middot;4&middot;3&middot;6 so the coils line up</td>
    </tr>
    <tr>
      <td>Chute (5th)</td>
      <td>4x1 dupont (2.54&nbsp;mm) on pin header J40</td>
      <td>Bare flying leads &rarr; crimp into a 4x1 housing</td>
      <td>unknown</td>
      <td>unknown</td>
      <td>Motor has no connector; crimp leads to the coil order above</td>
    </tr>
  </tbody>
</table>
<p class="meta">Refdes-to-channel assignment (which of J23/J27/J31/J35/J39 is which channel, and which is the chute) to confirm.</p>

<div class="note flag">
  <b>Polarity, restated.</b> The basically board v1.3 order is fixed (section 1). For channels 1-4 the cable lands board pins 1&middot;2&middot;3&middot;4 on motor pins 1&middot;4&middot;3&middot;6, which is what makes the motor coils match the basically board v1.3 grouping. Check the coils with a multimeter before plugging a motor in, and confirm against the actual motor before crimping the chute.
</div>
<PinSwap />

<h2>3 &nbsp; Connector reference</h2>
<ul class="tight">
  <li><b>4x1 dupont (2.54&nbsp;mm)</b>: board-side harness connector for the steppers, mates the 2.54&nbsp;mm pin headers J24, J28, J32, J36, J40.</li>
  <li><b>2.54&nbsp;mm (0.1") pin header, 4-pin</b>: the board headers the dupont plugs onto (J24, J28, J32, J36, J40).</li>
  <li><b>JST-PH 2.0&nbsp;mm, 4-pin</b>: also on the board (J23, J27, J31, J35, J39), same pinout as the headers.</li>
  <li><b>JST-PH 2.0&nbsp;mm, 6-pin (PHR-6)</b>: motor end of the channel cables. Pinout <code>A2 C1 B1 A1 C2 B2</code> across pins 1-6; the cable populates 1, 3, 4 and 6 only.</li>
</ul>

<h2>4 &nbsp; Sources</h2>
<ul class="tight">
  <li>StepperOnline NEMA 17 motors: <a href="https://www.omc-stepperonline.com/nema-17-stepper-motor">omc-stepperonline.com</a></li>
  <li>JST PH series: <a href="https://www.jst.com/products/crimp-style-connectors-wire-to-board-type/ph-connector/">jst.com</a></li>
</ul>
