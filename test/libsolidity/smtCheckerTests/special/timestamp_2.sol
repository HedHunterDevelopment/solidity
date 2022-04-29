contract C {
	uint x;

	constructor() {
		x = block.timestamp + 0; // No overflow should be reported
		x = block.timestamp + 1; // Overflow should be reported here
	}
}
// ====
// SMTEngine: all
// ----
// Warning 4984: (107-126): CHC: Overflow (resulting value larger than 2**256 - 1) happens here.\nCounterexample:\nx = 115792089237316195423570985008687907853269984665640564039457584007913129639935\n\nTransaction trace:\nC.constructor(){ block.timestamp: 115792089237316195423570985008687907853269984665640564039457584007913129639935 }
// Info 1180: Contract invariant(s) for :C:\n(true || true)\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at block.timestamp + 0\n<errorCode> = 2 -> Overflow at block.timestamp + 1\n
