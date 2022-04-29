contract C {
	uint a;
	constructor(uint x) {
		a = x;
	}
}

abstract contract B is C {
	uint b;
	constructor(uint x) {
		b = a + x;
	}
}

contract A is B {
	constructor(uint x) B(x) C(x + 2) {
		assert(a == x + 2);
		assert(b == x + x + 2);
		assert(a == x + 5);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 4984: (125-130): CHC: Overflow (resulting value larger than 2**256 - 1) happens here.
// Warning 4984: (184-189): CHC: Overflow (resulting value larger than 2**256 - 1) happens here.
// Warning 6328: (243-261): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true)\nContract invariant(s) for :A:\n(true || true)\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 2) = (:var 5)) && (b' = b) && (a' = a))\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :B:\n((<errorCode> = 0) && ((:var 2) = (:var 5)) && (b' = b) && (a' = a))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at x + 2\n<errorCode> = 2 -> Assertion failed at assert(a == x + 2)\n<errorCode> = 3 -> Overflow at x + x\n<errorCode> = 4 -> Overflow at x + x + 2\n<errorCode> = 5 -> Assertion failed at assert(b == x + x + 2)\n<errorCode> = 6 -> Overflow at x + 5\n<errorCode> = 7 -> Assertion failed at assert(a == x + 5)\n<errorCode> = 8 -> Overflow at a + x\n<errorCode> = 9 -> Overflow at x + 2\n
