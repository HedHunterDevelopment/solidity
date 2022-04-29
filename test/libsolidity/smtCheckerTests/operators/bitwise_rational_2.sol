contract C {
	function f() public pure {
		assert(~1 | (~0xff & 0) == -2);
		int x = ~1 | (~0xff ^ 0);
		/// Result is negative, assertion fails.
		assert(x > 0);
		int y = ~x | (0xff & 1);
		assert(y > 0);
		assert(y & (0xffffffffffffffffff & 1) == 1);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (148-161): CHC: Assertion violation happens here.\nCounterexample:\n\nx = (- 2)\ny = 0\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(~1 | (~0xff & 0) == -2)\n<errorCode> = 2 -> Assertion failed at assert(x > 0)\n<errorCode> = 3 -> Assertion failed at assert(y > 0)\n<errorCode> = 4 -> Assertion failed at assert(y & (0xffffffffffffffffff & 1) == 1)\n
