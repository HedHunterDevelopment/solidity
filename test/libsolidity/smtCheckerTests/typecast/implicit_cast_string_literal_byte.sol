contract C {
	mapping (bytes1 => uint) map;
	function f() public {
		map[""] = 2;
		uint x = map[""];
		g("");
		bytes1 b = "";
		assert(x == map[b]);
		assert(x == map["x"]);
	}
	function g(bytes1 b) internal pure {}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (153-174): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 2\nb = 0x0\n\nTransaction trace:\nC.constructor()\nC.f()\n    C.g(0x0) -- internal call
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (map' = map)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == map[b])\n<errorCode> = 2 -> Assertion failed at assert(x == map["x"])\n
