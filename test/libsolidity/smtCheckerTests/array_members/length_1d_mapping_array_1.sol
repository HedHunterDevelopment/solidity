contract C {
	mapping (uint => uint[]) map;
	function f() public view {
		assert(map[0].length == map[1].length);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n((true && (map[1].length <= 0)) || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (map' = map)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(map[0].length == map[1].length)\n
