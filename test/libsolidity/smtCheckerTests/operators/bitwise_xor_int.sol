contract C {
	function f() public pure {
		int8 x = 1;
		int16 y = 0;
		assert(x ^ y == 1);
		int16 z = -1;
		assert(x ^ z == -2);
		assert(y ^ z == -1);
		assert(y ^ z > 0);
		x = 7; y = 3;
		assert(x ^ y < 5);
		assert(x ^ y > 5);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (156-173): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 1\ny = 0\nz = (- 1)\n\nTransaction trace:\nC.constructor()\nC.f()
// Warning 6328: (214-231): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 7\ny = 3\nz = (- 1)\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x ^ y == 1)\n<errorCode> = 2 -> Assertion failed at assert(x ^ z == -2)\n<errorCode> = 3 -> Assertion failed at assert(y ^ z == -1)\n<errorCode> = 4 -> Assertion failed at assert(y ^ z > 0)\n<errorCode> = 5 -> Assertion failed at assert(x ^ y < 5)\n<errorCode> = 6 -> Assertion failed at assert(x ^ y > 5)\n
