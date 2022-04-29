contract C {
	uint a;
	constructor(uint x) {
		a = x;
	}
}

abstract contract B is C {
	uint b;
	constructor(uint x) {
		b = x + 10;
	}
}

contract A is B {
	constructor(uint x) B(x) C(x + 2) {
		assert(a == x + 2);
		assert(b == x + 10);
		assert(b == x + 5);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 4984: (125-131): CHC: Overflow (resulting value larger than 2**256 - 1) happens here.
// Warning 4984: (185-190): CHC: Overflow (resulting value larger than 2**256 - 1) happens here.
// Warning 6328: (241-259): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true)\nContract invariant(s) for :A:\n(true || true)\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 2) = (:var 5)) && (b' = b) && (a' = a))\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :B:\n((<errorCode> = 0) && ((:var 2) = (:var 5)) && (b' = b) && (a' = a))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at x + 2\n<errorCode> = 2 -> Assertion failed at assert(a == x + 2)\n<errorCode> = 3 -> Overflow at x + 10\n<errorCode> = 4 -> Assertion failed at assert(b == x + 10)\n<errorCode> = 5 -> Overflow at x + 5\n<errorCode> = 6 -> Assertion failed at assert(b == x + 5)\n<errorCode> = 7 -> Overflow at x + 10\n<errorCode> = 8 -> Overflow at x + 2\n
