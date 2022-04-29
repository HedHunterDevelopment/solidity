contract C
{
	function f(uint x) public pure {
		for (x = 0; x < 10; ++x)
			break;
		assert(x == 0);
	}
}
// ====
// SMTEngine: all
// SMTSolvers: z3
// ----
// Warning 5740: (69-72): Unreachable code.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at ++x\n<errorCode> = 2 -> Assertion failed at assert(x == 0)\n
