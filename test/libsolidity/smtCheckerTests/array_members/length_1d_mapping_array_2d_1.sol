contract C {
	mapping (uint => uint[][]) map;
	function f(uint x, uint y) public {
		require(x == y);
		map[x].push();
		assert(map[x][0].length == map[y][0].length);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (map' = map)) || true || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (map' = map)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at map[x][0]\n<errorCode> = 2 -> Out of bounds access at map[y][0]\n<errorCode> = 3 -> Assertion failed at assert(map[x][0].length == map[y][0].length)\n
