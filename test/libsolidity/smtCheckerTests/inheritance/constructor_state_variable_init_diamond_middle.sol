contract A {
	uint x = 1;
}

contract B is A {
	constructor() {
		assert(x == 1);
		x = 2;
	}
}

contract C is A {
	constructor() {
		assert(x == 1);
		x = 3;
	}
}

contract D is B, C {
	constructor() {
		assert(x == 3);
		assert(x == 4);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (134-148): CHC: Assertion violation happens here.\nCounterexample:\nx = 2\n\nTransaction trace:\nD.constructor()
// Warning 6328: (223-237): CHC: Assertion violation happens here.\nCounterexample:\nx = 3\n\nTransaction trace:\nD.constructor()
// Info 1180: Contract invariant(s) for :A:\n(true || true)\nContract invariant(s) for :C:\n(true || true)\nReentrancy property(ies) for :D:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :B:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 1)\n<errorCode> = 2 -> Assertion failed at assert(x == 1)\n<errorCode> = 3 -> Assertion failed at assert(x == 3)\n<errorCode> = 4 -> Assertion failed at assert(x == 4)\n<errorCode> = 5 -> Assertion failed at assert(x == 1)\n<errorCode> = 6 -> Assertion failed at assert(x == 1)\n
