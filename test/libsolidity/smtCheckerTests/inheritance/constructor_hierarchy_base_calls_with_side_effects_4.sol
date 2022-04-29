contract A {
	uint public x;
	constructor(uint a) { x = a; }
}

contract B is A {
	constructor(uint b) A(b + f()) {
	}

	function f() internal returns (uint) {
		x = x + 1;
		return x;
	}
}

abstract contract Z is A {
	uint k;
	constructor(uint z) {
		k = z;
	}
}

contract C is Z, B {
	constructor(uint c) Z(x) B(c) {
		assert(x == c + 1);
		assert(k == 0);
		assert(x == k); // should fail
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 4984: (105-112): CHC: Overflow (resulting value larger than 2**256 - 1) happens here.
// Warning 6328: (361-375): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :A:\n(true || true)\nContract invariant(s) for :B:\n(true || true)\nReentrancy property(ies) for :Z:\n((<errorCode> = 0) && ((:var 2) = (:var 5)) && (k' = k) && (x' = x))\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 2) = (:var 5)) && (k' = k) && (x' = x))\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :B:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at x + 1\n<errorCode> = 2 -> Overflow at b + f()\n<errorCode> = 3 -> Overflow at x + 1\n<errorCode> = 4 -> Overflow at c + 1\n<errorCode> = 5 -> Assertion failed at assert(x == c + 1)\n<errorCode> = 6 -> Assertion failed at assert(k == 0)\n<errorCode> = 7 -> Assertion failed at assert(x == k)\n<errorCode> = 8 -> Overflow at b + f()\n
