contract C {
	function i() public pure returns (uint d) {
		if (0==0)
			(d) = 13;
		assert(d == 13);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(d == 13)\n
// Warning 6838: (64-68): BMC: Condition is always true.
