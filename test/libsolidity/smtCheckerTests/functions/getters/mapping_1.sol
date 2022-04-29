contract C {
	mapping (uint => uint) public map;

	function f() public view {
		uint y = this.map(2);
		assert(y == map[2]); // should hold
		assert(y == 1); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (142-156): CHC: Assertion violation happens here.\nCounterexample:\n\ny = 0\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (map' = map)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(y == map[2])\n<errorCode> = 2 -> Assertion failed at assert(y == 1)\n
