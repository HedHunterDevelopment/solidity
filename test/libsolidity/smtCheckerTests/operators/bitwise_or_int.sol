contract C {
	function f() public pure {
		int16 x = 1;
		int16 y = 0;
		assert(x | y == 1);
		x = 0; y = 0;
		assert(x | y != 0);
		y = 240;
		x = 15;
		int16 z = x | y;
		assert(z == 255);
		x = -1; y = 200;
		assert(x | y == x);
		assert(x | z != -1);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (111-129): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 0\ny = 0\nz = 0\n\nTransaction trace:\nC.constructor()\nC.f()
// Warning 6328: (234-253): CHC: Assertion violation happens here.\nCounterexample:\n\nx = (- 1)\ny = 200\nz = 255\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n(true || true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x | y == 1)\n<errorCode> = 2 -> Assertion failed at assert(x | y != 0)\n<errorCode> = 3 -> Assertion failed at assert(z == 255)\n<errorCode> = 4 -> Assertion failed at assert(x | y == x)\n<errorCode> = 5 -> Assertion failed at assert(x | z != -1)\n
