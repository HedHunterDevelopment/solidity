contract C {
	uint8 x = 254;

	function inc_pre() public {
		++x;
	}

	function check() view public {
		uint y = x;
		assert(y < 256);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 4984: (61-64): CHC: Overflow (resulting value larger than 255) happens here.\nCounterexample:\nx = 255\n\nTransaction trace:\nC.constructor()\nState: x = 254\nC.inc_pre()\nState: x = 255\nC.inc_pre()
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || true || true || true || true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at ++x\n<errorCode> = 3 -> Assertion failed at assert(y < 256)\n
