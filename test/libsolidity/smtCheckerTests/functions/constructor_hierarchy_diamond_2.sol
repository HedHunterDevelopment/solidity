contract C {
	uint a;
	constructor(uint x) {
		a = x;
	}
}

abstract contract B1 is C {
	constructor(uint x) {
		a = x;
	}
}

contract B2 is C {
	constructor(uint x) C(x + 2) {
		a = x;
	}
}

contract A is B2, B1 {
	constructor(uint x) B1(x) B2(x) {
		assert(a == x);
		assert(a == x + 1);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 4984: (168-173): CHC: Overflow (resulting value larger than 2**256 - 1) happens here.
// Warning 6328: (270-288): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true)\nContract invariant(s) for :A:\n(true || true)\nContract invariant(s) for :B2:\n(true || true)\nReentrancy property(ies) for :B2:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :B1:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at x + 2\n<errorCode> = 2 -> Assertion failed at assert(a == x)\n<errorCode> = 3 -> Overflow at x + 1\n<errorCode> = 4 -> Assertion failed at assert(a == x + 1)\n<errorCode> = 5 -> Overflow at x + 2\n
