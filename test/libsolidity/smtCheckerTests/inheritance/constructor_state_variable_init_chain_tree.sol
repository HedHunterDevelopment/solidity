contract A {
	int x;
	constructor (int a) { x = a; }
}

contract Z {
	int z;
	constructor(int _z) {
		z = _z;
	}
}

contract B is A, Z {
	constructor(int b) A(b) Z(x) {
		assert(x == b);
		assert(z == 0);
	}
}

contract F is Z, A {
	constructor(int b) Z(x) A(b) {
		assert(x == b);
		assert(z == 0);
	}
}

contract C is B {
	constructor(int c) B(-c) {
		if (x > 0) {
			assert(c < 0); // should hold
			assert(c >= 0); // should fail
		}
		else {
			assert(c < 0); // should fail
			assert(c >= 0); // should hold
		}
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (403-417): CHC: Assertion violation happens here.\nCounterexample:\nz = 0, x = 1\nc = (- 1)\n\nTransaction trace:\nC.constructor((- 1))
// Warning 6328: (450-463): CHC: Assertion violation happens here.\nCounterexample:\nz = 0, x = 0\nc = 0\n\nTransaction trace:\nC.constructor(0)
// Info 1180: Contract invariant(s) for :A:\n(true || true)\nContract invariant(s) for :F:\n(true || true)\nContract invariant(s) for :C:\n(true || true)\nContract invariant(s) for :Z:\n(true || true)\nContract invariant(s) for :B:\n(true || true)\nReentrancy property(ies) for :F:\n((<errorCode> = 0) && ((:var 2) = (:var 5)) && (x' = x) && (z' = z))\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 2) = (:var 5)) && (z' = z) && (x' = x))\nReentrancy property(ies) for :Z:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (z' = z))\nReentrancy property(ies) for :B:\n((<errorCode> = 0) && ((:var 2) = (:var 5)) && (z' = z) && (x' = x))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == b)\n<errorCode> = 2 -> Assertion failed at assert(z == 0)\n<errorCode> = 3 -> Assertion failed at assert(x == b)\n<errorCode> = 4 -> Assertion failed at assert(z == 0)\n<errorCode> = 5 -> Assertion failed at assert(c < 0)\n<errorCode> = 6 -> Assertion failed at assert(c >= 0)\n<errorCode> = 7 -> Assertion failed at assert(c < 0)\n<errorCode> = 8 -> Assertion failed at assert(c >= 0)\n<errorCode> = 9 -> Assertion failed at assert(x == b)\n<errorCode> = 10 -> Assertion failed at assert(z == 0)\n
