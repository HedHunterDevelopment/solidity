contract C
{
	function f(uint x) public pure {
		require(x < 100);
		uint y = 200;
		y -= y - x;
		assert(y >= 0);
		assert(y < 90);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (117-131): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 90\ny = 90\n\nTransaction trace:\nC.constructor()\nC.f(90)
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Underflow at y - x\n<errorCode> = 2 -> Underflow at y -= y - x\n<errorCode> = 3 -> Assertion failed at assert(y >= 0)\n<errorCode> = 4 -> Assertion failed at assert(y < 90)\n
