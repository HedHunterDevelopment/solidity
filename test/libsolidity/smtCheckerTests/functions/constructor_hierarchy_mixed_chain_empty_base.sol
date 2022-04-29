contract F {
	uint a;
	constructor() {
		a = 2;
	}
}

contract E is F {}
contract D is E {
	constructor() {
		a = 3;
	}
}
contract C is D {}
contract B is C {
	constructor() {
		assert(a == 3);
		a = 4;
	}
}

contract A is B {
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :F:\n(true || true)\nContract invariant(s) for :E:\n(true || true)\nContract invariant(s) for :D:\n(true || true)\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :B:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :F:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :E:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\nReentrancy property(ies) for :D:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a == 3)\n<errorCode> = 2 -> Assertion failed at assert(a == 3)\n
