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
	constructor() B(f()) {
	}
}

contract C is Z {
	constructor() {
		assert(x == 1);
		assert(x > 2); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (354-367): CHC: Assertion violation happens here.\nCounterexample:\nx = 1\n\nTransaction trace:\nC.constructor()
// Info 1180: Contract invariant(s) for :A:\n(true || true)\nContract invariant(s) for :Z:\n(true || true)\nContract invariant(s) for :B:\n(true || true)\nReentrancy property(ies) for :Z:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :B:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at x + 1\n<errorCode> = 2 -> Overflow at x + 1\n<errorCode> = 3 -> Overflow at x + 1\n<errorCode> = 4 -> Assertion failed at assert(x == 1)\n<errorCode> = 5 -> Assertion failed at assert(x > 2)\n
