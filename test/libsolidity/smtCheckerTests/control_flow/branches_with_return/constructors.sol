contract B {
	int x;
	constructor(int b) {
		if (b > 0) {
			x = 1;
			return;
		}
		else {
			x = 2;
			return;
		}
		x = 3; // dead code
	}
}

contract C is B {
	constructor(int a) B(a) {
		assert(a > 0 || x == 2); // should hold
		assert(a <= 0 || x == 1); // should hold
		assert(x == 3); // should fail
		assert(x == 2); // should fail
		assert(x == 1); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 5740: (119-124): Unreachable code.
// Warning 6328: (277-291): CHC: Assertion violation happens here.\nCounterexample:\nx = 1\na = 1\n\nTransaction trace:\nC.constructor(1)
// Warning 6328: (310-324): CHC: Assertion violation happens here.\nCounterexample:\nx = 1\na = 1\n\nTransaction trace:\nC.constructor(1)
// Warning 6328: (343-357): CHC: Assertion violation happens here.\nCounterexample:\nx = 2\na = 0\n\nTransaction trace:\nC.constructor(0)
// Info 1180: Contract invariant(s) for :B:\n(true || true)\nContract invariant(s) for :C:\n(true || true)\nReentrancy property(ies) for :B:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a > 0 || x == 2)\n<errorCode> = 2 -> Assertion failed at assert(a <= 0 || x == 1)\n<errorCode> = 3 -> Assertion failed at assert(x == 3)\n<errorCode> = 4 -> Assertion failed at assert(x == 2)\n<errorCode> = 5 -> Assertion failed at assert(x == 1)\n
