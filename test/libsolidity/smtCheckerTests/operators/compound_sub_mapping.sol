contract C
{
	mapping (uint => uint) map;
	function f(uint x, uint p) public {
		require(x < 100);
		map[p] = 200;
		map[p] -= map[p] - x;
		assert(map[p] >= 0);
		assert(map[p] < 90);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6328: (164-183): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 1) = (:var 3)) && (map' = map)) || true || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Underflow at map[p] - x\n<errorCode> = 2 -> Underflow at map[p] -= map[p] - x\n<errorCode> = 3 -> Assertion failed at assert(map[p] >= 0)\n<errorCode> = 4 -> Assertion failed at assert(map[p] < 90)\n
