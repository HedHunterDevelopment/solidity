contract C {
	uint a;
	constructor(uint x) {
		a = x;
	}
}

abstract contract B1 is C {
	uint b1;
	constructor(uint x) {
		b1 = x + a;
	}
}

contract B2 is C {
	uint b2;
	constructor(uint x) C(x + 2) {
		b2 = x + a;
	}
}

contract A is B2, B1 {
	constructor(uint x) B2(x) B1(x) {
		assert(b1 == b2);
		assert(b1 != b2);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 4984: (193-198): CHC: Overflow (resulting value larger than 2**256 - 1) happens here.
// Warning 4984: (209-214): CHC: Overflow (resulting value larger than 2**256 - 1) happens here.
// Warning 6328: (302-318): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true)\nContract invariant(s) for :B2:\n(true || true)\nReentrancy property(ies) for :B2:\n((<errorCode> = 0) && ((:var 2) = (:var 5)) && (b2' = b2) && (a' = a))\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 3) = (:var 7)) && (b1' = b1) && (b2' = b2) && (a' = a))\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :B1:\n((<errorCode> = 0) && ((:var 2) = (:var 5)) && (b1' = b1) && (a' = a))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at x + a\n<errorCode> = 2 -> Overflow at x + 2\n<errorCode> = 3 -> Assertion failed at assert(b1 == b2)\n<errorCode> = 4 -> Assertion failed at assert(b1 != b2)\n<errorCode> = 5 -> Overflow at x + a\n<errorCode> = 6 -> Overflow at x + a\n<errorCode> = 7 -> Overflow at x + 2\n
