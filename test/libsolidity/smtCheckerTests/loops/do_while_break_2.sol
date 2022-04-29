contract C {
	function f() public pure {
		uint a = 0;
		while (true) {
			do {
				break;
				a = 2;
			} while (true);
			a = 1;
			break;
		}
		assert(a == 1);
	}
}
// ====
// SMTEngine: all
// SMTSolvers: z3
// ----
// Warning 5740: (95-100): Unreachable code.
// Warning 5740: (114-118): Unreachable code.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a == 1)\n
