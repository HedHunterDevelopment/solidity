contract C
{
	function f() public view {
		assert(gasleft() > 0);
		uint g = gasleft();
		assert(g < gasleft());
		assert(g >= gasleft());
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (43-64): CHC: Assertion violation happens here.\nCounterexample:\n\ng = 0\n\nTransaction trace:\nC.constructor()\nC.f()
// Warning 6328: (90-111): CHC: Assertion violation happens here.\nCounterexample:\n\ng = 0\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(gasleft() > 0)\n<errorCode> = 2 -> Assertion failed at assert(g < gasleft())\n<errorCode> = 3 -> Assertion failed at assert(g >= gasleft())\n
