contract A {
	uint x = 1;
}

contract B is A {
	constructor(int a) {
		if (a > 0) {
			x = 2;
			return;
		}
		x = 3;
	}
}

abstract contract C is B {
}

contract D is C {
	constructor(int a) B(a) {
		assert(a > 0 || x == 3); // should hold
		assert(a <= 0 || x == 2); // should hold
		assert(x == 1); // should fail
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6328: (286-300): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :A:\n(true || true)\nContract invariant(s) for :D:\n(true || true)\nContract invariant(s) for :B:\n(true || true)\nReentrancy property(ies) for :D:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :B:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a > 0 || x == 3)\n<errorCode> = 2 -> Assertion failed at assert(a <= 0 || x == 2)\n<errorCode> = 3 -> Assertion failed at assert(x == 1)\n
