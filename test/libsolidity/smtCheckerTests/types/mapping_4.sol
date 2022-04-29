contract C
{
	mapping (bool => bool) map;
	function f(bool x) public view {
		require(x);
		assert(x != map[x]);
	}
}
// ====
// SMTEngine: all
// SMTSolvers: z3
// ----
// Info 1180: Contract invariant(s) for :C:\n(!map[true] || true)\nReentrancy property(ies) for :C:\n(true || true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (map' = map)))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x != map[x])\n
