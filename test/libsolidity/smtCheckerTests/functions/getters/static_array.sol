
contract C {

	uint[2] public x = [42,1];

	function f() public view {
		assert(this.x(0) == x[0]); // should hold
		assert(this.x(1) == x[1]); // should hold
		assert(this.x(0) == 0); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (162-184): CHC: Assertion violation happens here.\nCounterexample:\nx = [42, 1]\n\nTransaction trace:\nC.constructor()\nState: x = [42, 1]\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(!(x.length <= 1) || true)\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at x[0]\n<errorCode> = 2 -> Assertion failed at assert(this.x(0) == x[0])\n<errorCode> = 3 -> Out of bounds access at x[1]\n<errorCode> = 4 -> Assertion failed at assert(this.x(1) == x[1])\n<errorCode> = 5 -> Assertion failed at assert(this.x(0) == 0)\n
