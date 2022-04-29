contract C {
	function f() public pure returns (int8) {
		uint8 x = 254;
		int8 y = 1;
		assert(y << x == 0);
		// Fails because z = 0.
		assert(y << x == 10);
		return y << x;
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (138-158): CHC: Assertion violation happens here.\nCounterexample:\n\n = 0\nx = 254\ny = 1\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(y << x == 0)\n<errorCode> = 2 -> Assertion failed at assert(y << x == 10)\n
