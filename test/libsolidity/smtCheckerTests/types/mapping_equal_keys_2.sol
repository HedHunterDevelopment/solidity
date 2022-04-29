contract C
{
	mapping (uint => uint) map;
	function f(uint x, uint y) public view {
		assert(x == y);
		assert(map[x] == map[y]);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6328: (86-100): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true)\nReentrancy property(ies) for :C:\n(true || true || true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (map' = map)))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == y)\n<errorCode> = 2 -> Assertion failed at assert(map[x] == map[y])\n
