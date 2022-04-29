contract A {
	uint public x;
	constructor(uint a) { x = a; }
}

contract B is A {
	constructor(uint b) A(b) {
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
		assert(x == 6);
		assert(x > 9); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 4984: (292-299): CHC: Overflow (resulting value larger than 2**256 - 1) happens here.\nCounterexample:\nx = 1\nz = 115792089237316195423570985008687907853269984665640564039457584007913129639935\n\nTransaction trace:\nZ.constructor(115792089237316195423570985008687907853269984665640564039457584007913129639935)
// Warning 6328: (367-380): CHC: Assertion violation happens here.\nCounterexample:\nx = 6\n\nTransaction trace:\nC.constructor()
// Info 1180: Contract invariant(s) for :A:\n(true || true)\nContract invariant(s) for :Z:\n(true || true)\nContract invariant(s) for :B:\n(true || true)\nReentrancy property(ies) for :Z:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :B:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at x + 1\n<errorCode> = 2 -> Overflow at x + 1\n<errorCode> = 3 -> Overflow at z + f()\n<errorCode> = 4 -> Overflow at x + 1\n<errorCode> = 5 -> Assertion failed at assert(x == 6)\n<errorCode> = 6 -> Assertion failed at assert(x > 9)\n<errorCode> = 7 -> Overflow at z + f()\n
