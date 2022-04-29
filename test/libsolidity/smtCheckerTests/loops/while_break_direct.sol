contract C
{
	function f(uint x) public pure {
		x = 0;
		while (x < 10)
			break;
		assert(x == 0);
	}
}
// ====
// SMTEngine: all
// SMTSolvers: z3
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 0)\n
// Warning 6838: (65-71): BMC: Condition is always true.
