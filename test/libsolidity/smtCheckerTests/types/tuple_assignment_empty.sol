contract C
{
	function g() public pure {
		uint x;
		uint y;
		(x, ) = (2, 4);
		assert(x == 2);
		assert(y == 4);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (99-113): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 2\ny = 0\n\nTransaction trace:\nC.constructor()\nC.g()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 2)\n<errorCode> = 2 -> Assertion failed at assert(y == 4)\n
