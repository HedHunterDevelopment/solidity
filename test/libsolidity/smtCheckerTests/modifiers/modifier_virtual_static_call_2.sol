contract A {
	int x = 0;

	modifier m virtual {
		assert(x == 0); // should hold
		assert(x == 42); // should fail
		_;
	}
}
contract C is A {

	modifier m override {
		assert(x == 1); // This assert is not reachable, should NOT be reported
		_;
	}

	function f() public A.m returns (uint) {
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (83-98): CHC: Assertion violation happens here.\nCounterexample:\nx = 0\n = 0\n\nTransaction trace:\nC.constructor()\nState: x = 0\nC.f()
// Info 1180: Contract invariant(s) for :A:\n(true || true)\nContract invariant(s) for :C:\n(((x >= 0) && (x <= 0)) || true)\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 0)\n<errorCode> = 2 -> Assertion failed at assert(x == 42)\n
