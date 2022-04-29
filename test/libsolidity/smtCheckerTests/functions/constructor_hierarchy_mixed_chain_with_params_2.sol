contract F {
	uint a;
	constructor(uint x) {
		a = x;
	}
}

abstract contract E is F {}
abstract contract D is E {
	constructor() {
		a = 3;
	}
}
abstract contract C is D {}
contract B is C {
	constructor() F(1) {
		assert(a == 3);
		assert(a == 2);
	}
}

contract A is B {
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (234-248): CHC: Assertion violation happens here.\nCounterexample:\na = 3\n\nTransaction trace:\nB.constructor()
// Info 1180: Contract invariant(s) for :F:\n(true || true)\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :B:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :F:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :E:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :D:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a == 3)\n<errorCode> = 2 -> Assertion failed at assert(a == 2)\n<errorCode> = 3 -> Assertion failed at assert(a == 3)\n<errorCode> = 4 -> Assertion failed at assert(a == 2)\n
