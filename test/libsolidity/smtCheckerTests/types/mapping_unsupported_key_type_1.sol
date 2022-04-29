contract C
{
	mapping (string => uint) map;
	function f(string memory s, uint x) public {
		map[s] = x;
		assert(x == map[s]);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (map' = map)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == map[s])\n
