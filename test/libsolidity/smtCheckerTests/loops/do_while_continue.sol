contract C {
	function f() public pure {
		uint x;
		do {
			continue;
			x = 1;
		} while (x == 0);
		assert(x == 0);
	}
}
// ====
// SMTEngine: all
// SMTSolvers: z3
// ----
// Warning 5740: (74-79): Unreachable code.
// Info 1180: Reentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 0)\n
