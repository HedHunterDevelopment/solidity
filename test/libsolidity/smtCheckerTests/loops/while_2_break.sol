contract C
{
	function f() public pure {
		uint x = 0;
		while (x == 0) {
			++x;
			break;
			++x;
		}
		assert(x == 1);
	}
}
// ====
// SMTEngine: all
// SMTSolvers: z3
// ----
// Warning 5740: (95-98): Unreachable code.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at ++x\n<errorCode> = 2 -> Overflow at ++x\n<errorCode> = 3 -> Assertion failed at assert(x == 1)\n
