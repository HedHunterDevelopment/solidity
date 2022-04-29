contract C {
	function f() public pure {
		int8 x = 1;
		int8 y = 0;
		x &= y;
		assert(x != 0); // fails
		x = -1; y = 3;
		y &= x;
		assert(y == 3);
		y = -1;
		y &= x;
		assert(y == -1);
		y = 127;
		x &= y;
		assert(x == 127);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (81-95): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 0\ny = 0\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x != 0)\n<errorCode> = 2 -> Assertion failed at assert(y == 3)\n<errorCode> = 3 -> Assertion failed at assert(y == -1)\n<errorCode> = 4 -> Assertion failed at assert(x == 127)\n
