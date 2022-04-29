contract A {
	uint public x;
	constructor(uint a) { x = a; }
}

contract B is A(9) {
	constructor(uint b) {
		x += b;
	}

	function f() internal returns (uint) {
		x = x + 1;
		return x;
	}

	function g() internal returns (uint) {
		x = 42;
		return x;
	}
}

contract Z is B {
	constructor(uint z) B(z + f()) {
	}
}

contract C is Z(5) {
	constructor() {
		assert(x == 15);
		assert(x > 90); // should fail
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 4984: (110-116): CHC: Overflow (resulting value larger than 2**256 - 1) happens here.
// Warning 4984: (300-307): CHC: Overflow (resulting value larger than 2**256 - 1) happens here.
// Warning 6328: (376-390): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :A:\n(true || true)\nContract invariant(s) for :B:\n(true || true)\nReentrancy property(ies) for :Z:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :B:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at x + 1\n<errorCode> = 2 -> Overflow at x += b\n<errorCode> = 3 -> Overflow at x + 1\n<errorCode> = 4 -> Overflow at x += b\n<errorCode> = 5 -> Overflow at z + f()\n<errorCode> = 6 -> Overflow at x + 1\n<errorCode> = 7 -> Assertion failed at assert(x == 15)\n<errorCode> = 8 -> Assertion failed at assert(x > 90)\n<errorCode> = 9 -> Overflow at x += b\n<errorCode> = 10 -> Overflow at z + f()\n
