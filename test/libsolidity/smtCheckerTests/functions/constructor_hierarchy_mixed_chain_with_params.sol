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
	constructor(uint x) F(x + 1) {
	}
}

contract A is B {
	constructor(uint x) B(x) {
		assert(a == 3);
		assert(a == 4);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 4984: (215-220): CHC: Overflow (resulting value larger than 2**256 - 1) happens here.
// Warning 6328: (296-310): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :F:\n(true || true)\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :B:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :F:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :E:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :D:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at x + 1\n<errorCode> = 2 -> Assertion failed at assert(a == 3)\n<errorCode> = 3 -> Assertion failed at assert(a == 4)\n<errorCode> = 4 -> Overflow at x + 1\n
