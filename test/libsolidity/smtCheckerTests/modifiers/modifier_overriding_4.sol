abstract contract A {
	int x = 0;

	function f() public view mod() {
		assert(x != 0); // does not hold for A, but A is abstract so it should not be reported
		assert(x != 1); // fails for B
		assert(x != 2); // fails for C
		assert(x != 3); // fails for D
	}

	modifier mod() virtual {
		_;
	}
}

contract B is A {
	modifier mod() virtual override {
		x = 1;
		_;
	}
}

contract C is A {
	modifier mod() virtual override {
		x = 2;
		_;
	}
}

contract D is B,C {
	modifier mod() virtual override (B,C){
		x = 3;
		_;
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (160-174): CHC: Assertion violation happens here.\nCounterexample:\nx = 1\n\nTransaction trace:\nB.constructor()\nState: x = 0\nA.f()
// Warning 6328: (193-207): CHC: Assertion violation happens here.\nCounterexample:\nx = 2\n\nTransaction trace:\nC.constructor()\nState: x = 0\nA.f()
// Warning 6328: (226-240): CHC: Assertion violation happens here.\nCounterexample:\nx = 3\n\nTransaction trace:\nD.constructor()\nState: x = 0\nA.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nContract invariant(s) for :D:\n(true || true || true)\nContract invariant(s) for :B:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true)\nReentrancy property(ies) for :D:\n(((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true)\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :B:\n(((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x != 0)\n<errorCode> = 2 -> Assertion failed at assert(x != 1)\n<errorCode> = 3 -> Assertion failed at assert(x != 2)\n<errorCode> = 4 -> Assertion failed at assert(x != 3)\n<errorCode> = 6 -> Assertion failed at assert(x != 0)\n<errorCode> = 7 -> Assertion failed at assert(x != 1)\n<errorCode> = 8 -> Assertion failed at assert(x != 2)\n<errorCode> = 9 -> Assertion failed at assert(x != 3)\n<errorCode> = 11 -> Assertion failed at assert(x != 0)\n<errorCode> = 12 -> Assertion failed at assert(x != 1)\n<errorCode> = 13 -> Assertion failed at assert(x != 2)\n<errorCode> = 14 -> Assertion failed at assert(x != 3)\n
