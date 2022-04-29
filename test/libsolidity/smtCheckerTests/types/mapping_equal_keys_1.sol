contract C
{
	mapping (uint => uint) map;
	function f(uint x, uint y) public view {
		require(x == y);
		assert(map[x] == map[y]);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (map' = map)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(map[x] == map[y])\n
