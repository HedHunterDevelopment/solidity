contract A {
	uint x;
	function f() internal virtual {
		v();
		assert(x == 2); // should hold
	}
	function v() internal virtual {
		x = 0;
	}
	function g() public virtual {
		v();
		assert(x == 2); // should fail
	}
}

contract B is A {
	function f() internal virtual override {
		super.f();
	}
}

contract C is B {
	function g() public override {
		x = 1;
		f();
	}
	function v() internal override {
		x = 2;
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (183-197): CHC: Assertion violation happens here.\nCounterexample:\nx = 0\n\nTransaction trace:\nA.constructor()\nState: x = 0\nA.g()\n    A.v() -- internal call
// Info 1180: Contract invariant(s) for :A:\n(true || true || true)\nContract invariant(s) for :C:\n(true || true || true)\nContract invariant(s) for :B:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true)\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)))\nReentrancy property(ies) for :A:\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true)\n(true || true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)))\nReentrancy property(ies) for :B:\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 2)\n<errorCode> = 2 -> Assertion failed at assert(x == 2)\n<errorCode> = 4 -> Assertion failed at assert(x == 2)\n<errorCode> = 5 -> Assertion failed at assert(x == 2)\n<errorCode> = 7 -> Assertion failed at assert(x == 2)\n<errorCode> = 8 -> Assertion failed at assert(x == 2)\n
