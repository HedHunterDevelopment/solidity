contract C
{
	uint s;
	modifier m(uint a) {
		// Condition is always true for m(2).
		require(a > 0);
		_;
	}

	function f(uint x) m(x) m(2) m(s) public view {
		assert(x > 0);
		assert(s > 0);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (s' = s)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x > 0)\n<errorCode> = 2 -> Assertion failed at assert(s > 0)\n
