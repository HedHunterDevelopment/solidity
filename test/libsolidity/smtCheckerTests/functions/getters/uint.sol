contract C {
	uint public x;

	function f() public view {
		uint y = this.x();
		assert(y == x); // should hold
		assert(y == 1); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (114-128): CHC: Assertion violation happens here.\nCounterexample:\nx = 0\ny = 0\n\nTransaction trace:\nC.constructor()\nState: x = 0\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(y == x)\n<errorCode> = 2 -> Assertion failed at assert(y == 1)\n
