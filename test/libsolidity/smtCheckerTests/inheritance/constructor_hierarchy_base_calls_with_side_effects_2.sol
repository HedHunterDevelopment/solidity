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
}

abstract contract Z is A {
	uint k;
	constructor(uint z) {
		k = z;
	}
}

contract C is Z, B {
	constructor() B(f()) Z(f()) {
		assert(x == 1);
		assert(k == 2);
		assert(x == k); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (349-363): CHC: Assertion violation happens here.\nCounterexample:\nk = 2, x = 1\n\nTransaction trace:\nC.constructor()
// Info 1180: Contract invariant(s) for :A:\n(true || true)\nContract invariant(s) for :C:\n(true || true)\nContract invariant(s) for :B:\n(true || true)\nReentrancy property(ies) for :Z:\n((<errorCode> = 0) && ((:var 2) = (:var 5)) && (k' = k) && (x' = x))\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 2) = (:var 5)) && (k' = k) && (x' = x))\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :B:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at x + 1\n<errorCode> = 2 -> Overflow at x + 1\n<errorCode> = 3 -> Assertion failed at assert(x == 1)\n<errorCode> = 4 -> Assertion failed at assert(k == 2)\n<errorCode> = 5 -> Assertion failed at assert(x == k)\n
