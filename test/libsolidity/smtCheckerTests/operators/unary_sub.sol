contract C
{
	function f() public pure {
		uint x = 5;
		uint a = --x;
		assert(x == 4);
		assert(a == 4);
		uint b = x--;
		assert(x == 3);
		// Should fail.
		assert(b > 4);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (161-174): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 3\na = 4\nb = 4\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Underflow at --x\n<errorCode> = 2 -> Assertion failed at assert(x == 4)\n<errorCode> = 3 -> Assertion failed at assert(a == 4)\n<errorCode> = 4 -> Underflow at x--\n<errorCode> = 5 -> Assertion failed at assert(x == 3)\n<errorCode> = 6 -> Assertion failed at assert(b > 4)\n
