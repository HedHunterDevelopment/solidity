contract C {
	mapping (uint => uint) map;
	function f(uint x, uint p) public {
		require(x == 2);
		map[p] = 10;
		map[p] /= map[p] / x;
		assert(map[p] == x);
		assert(map[p] == 0);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreOS: macos
// ----
// Warning 6328: (162-181): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 2\np = 0\n\nTransaction trace:\nC.constructor()\nC.f(2, 0)
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 1) = (:var 3)) && (map' = map)) || true || true || true || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (map' = map)) || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Division by zero at map[p] / x\n<errorCode> = 3 -> Division by zero at map[p] /= map[p] / x\n<errorCode> = 5 -> Assertion failed at assert(map[p] == x)\n<errorCode> = 6 -> Assertion failed at assert(map[p] == 0)\n
