contract C
{
	mapping (uint => uint) map;
	function f() public {
		map[1] = 111;
		uint x = map[2];
		map[1] = 112;
		assert(map[2] == x);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (map' = map)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(map[2] == x)\n
