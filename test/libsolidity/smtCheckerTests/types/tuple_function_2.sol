contract C
{
	function f() internal pure returns (uint, uint) {
		return (2, 3);
	}
	function g() public pure {
		uint x;
		uint y;
		(x,) = f();
		assert(x == 2);
		assert(y == 4);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (166-180): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 2\ny = 0\n\nTransaction trace:\nC.constructor()\nC.g()\n    C.f() -- internal call
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 2)\n<errorCode> = 2 -> Assertion failed at assert(y == 4)\n
