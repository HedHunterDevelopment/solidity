contract C {
	uint a;
	constructor() {
		a = 2;
	}
}

contract B is C {
}

contract B2 is C {
}

contract A is B, B2 {
	constructor(uint x) {
		assert(a == 2);
		assert(a == 3);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 5667: (132-138): Unused function parameter. Remove or comment out the variable name to silence this warning.
// Warning 6328: (162-176): CHC: Assertion violation happens here.\nCounterexample:\na = 2\nx = 0\n\nTransaction trace:\nA.constructor(0)
// Info 1180: Contract invariant(s) for :C:\n(true || true)\nContract invariant(s) for :B:\n(true || true)\nContract invariant(s) for :B2:\n(true || true)\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :B:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :B2:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a == 2)\n<errorCode> = 2 -> Assertion failed at assert(a == 3)\n
