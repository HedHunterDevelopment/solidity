contract C
{
	function f(uint x) public pure {
		require(x < 100);
		uint y = 100;
		y += y + x;
		assert(y < 300);
		assert(y < 110);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (118-133): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 0\ny = 200\n\nTransaction trace:\nC.constructor()\nC.f(0)
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at y + x\n<errorCode> = 2 -> Overflow at y += y + x\n<errorCode> = 3 -> Assertion failed at assert(y < 300)\n<errorCode> = 4 -> Assertion failed at assert(y < 110)\n
