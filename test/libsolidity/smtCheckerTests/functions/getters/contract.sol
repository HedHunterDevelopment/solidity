contract D {}

contract C {
	D public d;

	function f() public view {
		D e = this.d();
		assert(e == d); // should hold
		assert(address(e) == address(this)); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (123-158): CHC: Assertion violation happens here.\nCounterexample:\nd = 0\ne = 0\n\nTransaction trace:\nC.constructor()\nState: d = 0\nC.f()
// Info 1180: Contract invariant(s) for :D:\n(true || true)\nContract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :D:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (d' = d)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(e == d)\n<errorCode> = 2 -> Assertion failed at assert(address(e) == address(this))\n
