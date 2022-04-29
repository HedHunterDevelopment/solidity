contract C {
	function f(uint x) public pure {
		require(x == 2);
		uint y = 10;
		y /= y / x;
		assert(y == x);
		assert(y == 0);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (115-129): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 2\ny = 2\n\nTransaction trace:\nC.constructor()\nC.f(2)
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true)\n(true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Division by zero at y / x\n<errorCode> = 3 -> Division by zero at y /= y / x\n<errorCode> = 5 -> Assertion failed at assert(y == x)\n<errorCode> = 6 -> Assertion failed at assert(y == 0)\n
