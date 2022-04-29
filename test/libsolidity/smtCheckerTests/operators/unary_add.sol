contract C
{
	function f() public pure {
		uint x = 2;
		uint a = ++x;
		assert(x == 3);
		assert(a == 3);
		uint b = x++;
		assert(x == 4);
		// Should fail.
		assert(b < 3);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (161-174): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 4\na = 3\nb = 3\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at ++x\n<errorCode> = 2 -> Assertion failed at assert(x == 3)\n<errorCode> = 3 -> Assertion failed at assert(a == 3)\n<errorCode> = 4 -> Overflow at x++\n<errorCode> = 5 -> Assertion failed at assert(x == 4)\n<errorCode> = 6 -> Assertion failed at assert(b < 3)\n
