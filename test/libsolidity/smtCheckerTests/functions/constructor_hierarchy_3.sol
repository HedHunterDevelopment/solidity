contract C {
	uint a;
	constructor(uint x) {
		a = x;
	}
}

abstract contract B is C {
	constructor(uint x) {
		a = x;
	}
}

contract A is B {
	constructor(uint x) B(x) C(x + 2) {
		assert(a == x);
		assert(a == x + 1);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 4984: (171-176): CHC: Overflow (resulting value larger than 2**256 - 1) happens here.
// Warning 6328: (200-218): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true)\nContract invariant(s) for :A:\n(true || true)\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :B:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a == x)\n<errorCode> = 2 -> Overflow at x + 1\n<errorCode> = 3 -> Assertion failed at assert(a == x + 1)\n<errorCode> = 4 -> Overflow at x + 2\n
