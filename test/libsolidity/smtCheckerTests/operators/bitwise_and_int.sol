contract C {
	function f() public pure {
		int8 x = 1;
		int8 y = 0;
		assert(x & y != 0);
		x = -1; y = 3;
		assert(x & y == 3);
		y = -1;
		int8 z = x & y;
		assert(z == -1);
		y = 127;
		assert(x & y == 127);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (71-89): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 1\ny = 0\nz = 0\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x & y != 0)\n<errorCode> = 2 -> Assertion failed at assert(x & y == 3)\n<errorCode> = 3 -> Assertion failed at assert(z == -1)\n<errorCode> = 4 -> Assertion failed at assert(x & y == 127)\n
