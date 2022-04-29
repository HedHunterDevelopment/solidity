contract C {
	function f() public pure {
		int8 x = 1;
		int8 y = 0;
		x ^= y;
		assert(x != 1); // fails
		x = -1; y = 1;
		x ^= y;
		assert(x == -2);
		x = 4;
		y ^= x;
		assert(y == 5);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (81-95): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 1\ny = 0\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x != 1)\n<errorCode> = 2 -> Assertion failed at assert(x == -2)\n<errorCode> = 3 -> Assertion failed at assert(y == 5)\n
