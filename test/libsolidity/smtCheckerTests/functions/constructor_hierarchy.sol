contract C {
	uint a;
	constructor(uint x) {
		a = x;
	}
}

contract A is C {
	constructor() C(2) {
		assert(a == 2);
		assert(a == 3);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (120-134): CHC: Assertion violation happens here.\nCounterexample:\na = 2\n\nTransaction trace:\nA.constructor()
// Info 1180: Contract invariant(s) for :C:\n(true || true)\nContract invariant(s) for :A:\n(true || true)\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a == 2)\n<errorCode> = 2 -> Assertion failed at assert(a == 3)\n
