<!--
  Single system interconnect: PSU (24V) feeds basically board v1.3 and the other
  direct loads; basically board v1.3 drives the LEDs, sensors, steppers and the
  first servo adapter board.
-->
<figure>
  <div class="fig">
    <svg viewBox="-120 0 1080 545" xmlns="http://www.w3.org/2000/svg"
         font-family="-apple-system,Segoe UI,Roboto,sans-serif">
      <g stroke="#333" stroke-width="1.5" fill="none" stroke-linecap="round">
        <!-- PSU + board boxes -->
        <rect x="14" y="40" width="150" height="486" rx="4" fill="#fafafa" />
        <rect x="250" y="50" width="180" height="280" rx="4" fill="#fafafa" />
        <!-- PSU -> col B -->
        <line x1="164" y1="190" x2="250" y2="190" />
        <line x1="164" y1="360" x2="250" y2="360" />
        <line x1="164" y1="410" x2="250" y2="410" />
        <line x1="164" y1="460" x2="250" y2="460" />
        <line x1="164" y1="510" x2="250" y2="510" />
        <!-- board -> col C (7 outputs) -->
        <line x1="430" y1="70" x2="640" y2="50" />
        <line x1="430" y1="110" x2="640" y2="100" />
        <line x1="430" y1="150" x2="640" y2="150" />
        <line x1="430" y1="190" x2="640" y2="200" />
        <line x1="430" y1="230" x2="640" y2="250" />
        <line x1="430" y1="270" x2="640" y2="300" />
        <line x1="430" y1="310" x2="640" y2="350" />
      </g>

      <!-- PSU output stubs -->
      <g stroke="#333" stroke-width="1.2" fill="#fff">
        <rect x="158" y="182" width="14" height="16" /><rect x="158" y="352" width="14" height="16" />
        <rect x="158" y="402" width="14" height="16" /><rect x="158" y="452" width="14" height="16" />
        <rect x="158" y="502" width="14" height="16" /><rect x="158" y="82" width="14" height="16" />
      </g>

      <!-- col B direct-load boxes -->
      <g stroke="#333" stroke-width="1.2" fill="#fff">
        <rect x="250" y="345" width="180" height="30" rx="3" />
        <rect x="250" y="395" width="180" height="30" rx="3" />
        <rect x="250" y="445" width="180" height="30" rx="3" />
        <rect x="250" y="495" width="180" height="30" rx="3" />
      </g>

      <!-- col C boxes -->
      <g stroke="#333" stroke-width="1.2" fill="#fff">
        <rect x="640" y="33" width="300" height="34" rx="3" />
        <rect x="640" y="83" width="300" height="34" rx="3" />
        <rect x="640" y="133" width="300" height="34" rx="3" />
        <rect x="640" y="183" width="300" height="34" rx="3" />
        <rect x="640" y="233" width="300" height="34" rx="3" />
        <rect x="640" y="283" width="300" height="34" rx="3" />
        <rect x="640" y="333" width="300" height="34" rx="3" />
      </g>

      <!-- PSU text -->
      <text x="24" y="66" font-size="13" font-weight="700">MEAN WELL</text>
      <text x="24" y="82" font-size="12" font-weight="700">LRS-350-24</text>
      <text x="24" y="100" font-size="11" fill="#666">24V &middot; 14.6A &middot; 350W</text>
      <!-- AC power inlet, opposite side from the DC jacks -->
      <line x1="-56" y1="118" x2="14" y2="118" stroke="#333" stroke-width="1.5" stroke-linecap="round" />
      <rect x="-96" y="104" width="40" height="28" rx="3" fill="#fff" stroke="#333" stroke-width="1.2" />
      <text x="-76" y="122" font-size="10" font-weight="700" text-anchor="middle">AC in</text>
      <text x="-76" y="147" font-size="9" fill="#666" text-anchor="middle">fused inlet switch</text>
      <g font-size="11" fill="#333" text-anchor="end" font-weight="700">
        <text x="154" y="194">J1</text><text x="154" y="364">J2</text><text x="154" y="414">J3</text>
        <text x="154" y="464">J4</text><text x="154" y="514">J5</text><text x="154" y="94">J6</text>
      </g>
      <text x="180" y="94" font-size="10" fill="#666" font-style="italic">spare?</text>

      <!-- board text -->
      <text x="262" y="80" font-size="13" font-weight="700">basically board</text>
      <text x="262" y="96" font-size="12" font-weight="700">v1.3</text>
      <text x="262" y="118" font-size="10.5" fill="#666">hub for LEDs, sensors,</text>
      <text x="262" y="132" font-size="10.5" fill="#666">steppers, servo adapters</text>
      <text x="262" y="184" font-size="9.5" fill="#666">24V in: JST-XH female</text>

      <!-- PSU -> col B labels -->
      <g font-size="11" fill="#333" text-anchor="middle">
        <text x="207" y="184">W1 &middot; 36 in</text>
        <text x="207" y="354">W2 &middot; 12 in</text>
        <text x="207" y="404">W3 &middot; 6 in</text>
        <text x="207" y="454">W4 &middot; 36 in</text>
        <text x="207" y="504">W5 &middot; 36 in</text>
      </g>
      <g font-size="10" fill="#a12a1e" font-style="italic" text-anchor="middle">
        <text x="207" y="203">too long</text>
        <text x="207" y="473">too long</text>
        <text x="207" y="523">too long</text>
      </g>

      <!-- board -> col C labels -->
      <g font-size="10.5" fill="#333" text-anchor="middle">
        <text x="535" y="48">L1 &middot; 2x1 dupont &middot; 36+6 in</text>
        <text x="535" y="93">L2 &middot; 2x1 dupont &middot; 36+6 in</text>
        <text x="535" y="143">L3 &middot; 2x1 dupont &middot; 36+6 in</text>
        <text x="535" y="188">limit &middot; 2x1 dupont</text>
        <text x="535" y="233">S1-4 &middot; 4x1 dupont &middot; 1 m</text>
        <text x="535" y="283">CH &middot; 4x1 dupont &middot; flying leads</text>
        <text x="535" y="328">RIB &middot; 16-pin IDC &middot; 1 m</text>
      </g>

      <!-- col B direct-load titles -->
      <g font-size="11" font-weight="700">
        <text x="258" y="364">Waveshare 4-port USB hub</text>
        <text x="258" y="414">Orange Pi 5</text>
        <text x="258" y="464">Fan &middot; 24V 40mm</text>
        <text x="258" y="514">Fan &middot; 24V 40mm</text>
      </g>

      <!-- col C titles -->
      <g font-size="12" font-weight="700">
        <text x="652" y="55">COB board</text>
        <text x="652" y="105">COB board</text>
        <text x="652" y="155">LED strip (6000K)</text>
        <text x="652" y="205">Limit switch</text>
        <text x="652" y="255">Stepper, channels 1-4 (&times;4)</text>
        <text x="652" y="305">Chute stepper</text>
        <text x="652" y="355">Servo adapter board (first)</text>
      </g>
    </svg>
  </div>
  <figcaption>
    PSU distributes 24V to basically board v1.3 (through a JST-XH inlet) and the other direct loads
    (USB hub, Orange Pi, fans). basically board v1.3 then drives the LED drops (L1-L3), the limit switch,
    the steppers, and the first servo adapter board over a 16-pin IDC ribbon. Wire IDs match the schedule below.
  </figcaption>
</figure>
