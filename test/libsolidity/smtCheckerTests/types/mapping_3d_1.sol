contract C
{
	mapping (uint => mapping (uint => mapping (uint => uint))) map;
	function f(uint x) public {
		x = 42;
		map[13][14][15] = 42;
		assert(x == map[13][14][15]);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (map' = map)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == map[13][14][15])\n
