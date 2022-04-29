contract C {
	function f() public pure {
		assert(1 & 0 != 0);
		assert(-1 & 3 == 3);
		assert(-1 & -1 == -1);
		assert(-1 & 127 == 127);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (43-61): CHC: Assertion violation happens here.\nCounterexample:\n\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(1 & 0 != 0)\n<errorCode> = 2 -> Assertion failed at assert(-1 & 3 == 3)\n<errorCode> = 3 -> Assertion failed at assert(-1 & -1 == -1)\n<errorCode> = 4 -> Assertion failed at assert(-1 & 127 == 127)\n
