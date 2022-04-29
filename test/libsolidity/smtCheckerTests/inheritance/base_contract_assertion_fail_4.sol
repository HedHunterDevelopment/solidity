contract A {
	uint x;
	function f() internal virtual {
		v();
		assert(x == 0); // should fail
		assert(x == 2); // should hold
	}
	function v() internal virtual {
		x = 0;
	}
}
contract A1 is A {
	function f() internal virtual override {
		super.f();
	}
}
contract B is A {
	function f() internal virtual override {
		super.f();
	}
}

contract C is B, A1 {
	function g() public {
		x = 1;
		f();
	}
	function f() internal override(B, A1) {
		super.f();
	}
	function v() internal override {
		x = 2;
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (64-78): CHC: Assertion violation happens here.\nCounterexample:\nx = 2\n\nTransaction trace:\nC.constructor()\nState: x = 0\nC.g()\n    C.f() -- internal call\n        A1.f() -- internal call\n            B.f() -- internal call\n                A.f() -- internal call\n                    C.v() -- internal call
// Info 1180: Contract invariant(s) for :A:\n(true || true)\nContract invariant(s) for :B:\n(true || true)\nContract invariant(s) for :A1:\n(true || true)\nReentrancy property(ies) for :B:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :A1:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 0)\n<errorCode> = 2 -> Assertion failed at assert(x == 2)\n<errorCode> = 3 -> Assertion failed at assert(x == 0)\n<errorCode> = 4 -> Assertion failed at assert(x == 2)\n<errorCode> = 5 -> Assertion failed at assert(x == 0)\n<errorCode> = 6 -> Assertion failed at assert(x == 2)\n<errorCode> = 7 -> Assertion failed at assert(x == 0)\n<errorCode> = 8 -> Assertion failed at assert(x == 2)\n
