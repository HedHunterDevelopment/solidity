contract C
{
	function f() public pure {
		uint a = 1;
		uint b = 3;
		a += ((((b))));
		assert(a == 3);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (89-103): CHC: Assertion violation happens here.\nCounterexample:\n\na = 4\nb = 3\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at a += ((((b))))\n<errorCode> = 2 -> Assertion failed at assert(a == 3)\n
