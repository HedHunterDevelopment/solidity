contract F {
	uint a;
	constructor() {
		a = 2;
	}
}

contract E is F {}
contract D is E {}
contract C is D {}
contract B is C {}

contract A is B {
	constructor(uint x) {
		assert(a == 2);
		assert(a == 3);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 5667: (162-168): Unused function parameter. Remove or comment out the variable name to silence this warning.
// Warning 6328: (192-206): CHC: Assertion violation happens here.\nCounterexample:\na = 2\nx = 0\n\nTransaction trace:\nA.constructor(0)
// Info 1180: Contract invariant(s) for :F:\n(true || true)\nContract invariant(s) for :E:\n(true || true)\nContract invariant(s) for :D:\n(true || true)\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :B:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :F:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :E:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :D:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a == 2)\n<errorCode> = 2 -> Assertion failed at assert(a == 3)\n
