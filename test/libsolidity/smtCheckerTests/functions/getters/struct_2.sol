//pragma abicoder v2;

contract C {
	struct S {
		uint[2] a;
		uint u;
	}

	S public s;

	function f() public view {
		uint u = this.s();
		assert(u == s.u); // should hold
		assert(u == 1); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (175-189): CHC: Assertion violation happens here.\nCounterexample:\ns = {a: [0, 0], u: 0}\nu = 0\n\nTransaction trace:\nC.constructor()\nState: s = {a: [0, 0], u: 0}\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (s' = s)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(u == s.u)\n<errorCode> = 2 -> Assertion failed at assert(u == 1)\n
