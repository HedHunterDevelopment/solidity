contract A {
	int x;
}

contract B is A {
	int y;
	constructor (int a) {
		if (a >= 0) {
			y = 1;
			return;
		}
		x = 1;
		y = 2;
	}
}

contract C is A {
	int z;
	constructor (int a) {
		if (a >= 0) {
			z = 1;
			return;
		}
		x = -1;
		z = 2;
	}
}

contract D1 is B, C {
	constructor() B(1) C(1) {
		assert(x == 0); // should hold
		assert(x == 1); // should fail
		assert(x == -1); // should fail
	}
}

contract D2 is B, C {
	constructor() B(1) C(-1) {
		assert(x == 0); // should fail
		assert(x == 1); // should fail
		assert(x == -1); // should hold (constructor of C is executed AFTER constructor of B)
	}
}

contract D3 is B, C {
	constructor() B(-1) C(1) {
		assert(x == 0); // should fail
		assert(x == 1); // should hold
		assert(x == -1); // should fail
	}
}

contract D4 is B, C {
	constructor() B(-1) C(-1) {
		assert(x == 0); // should fail
		assert(x == 1); // should fail
		assert(x == -1); // should hold (constructor of C is executed AFTER constructor of B)
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (337-351): CHC: Assertion violation happens here.\nCounterexample:\nz = 1, y = 1, x = 0\n\nTransaction trace:\nD1.constructor()
// Warning 6328: (370-385): CHC: Assertion violation happens here.\nCounterexample:\nz = 1, y = 1, x = 0\n\nTransaction trace:\nD1.constructor()
// Warning 6328: (460-474): CHC: Assertion violation happens here.\nCounterexample:\nz = 2, y = 1, x = (- 1)\n\nTransaction trace:\nD2.constructor()
// Warning 6328: (493-507): CHC: Assertion violation happens here.\nCounterexample:\nz = 2, y = 1, x = (- 1)\n\nTransaction trace:\nD2.constructor()
// Warning 6328: (670-684): CHC: Assertion violation happens here.\nCounterexample:\nz = 1, y = 2, x = 1\n\nTransaction trace:\nD3.constructor()
// Warning 6328: (736-751): CHC: Assertion violation happens here.\nCounterexample:\nz = 1, y = 2, x = 1\n\nTransaction trace:\nD3.constructor()
// Warning 6328: (827-841): CHC: Assertion violation happens here.\nCounterexample:\nz = 2, y = 2, x = (- 1)\n\nTransaction trace:\nD4.constructor()
// Warning 6328: (860-874): CHC: Assertion violation happens here.\nCounterexample:\nz = 2, y = 2, x = (- 1)\n\nTransaction trace:\nD4.constructor()
// Info 1180: Contract invariant(s) for :A:\n(true || true)\nContract invariant(s) for :B:\n(true || true)\nContract invariant(s) for :C:\n(true || true)\nReentrancy property(ies) for :D1:\n((<errorCode> = 0) && ((:var 3) = (:var 7)) && (z' = z) && (y' = y) && (x' = x))\nReentrancy property(ies) for :D2:\n((<errorCode> = 0) && ((:var 3) = (:var 7)) && (z' = z) && (y' = y) && (x' = x))\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :D3:\n((<errorCode> = 0) && ((:var 3) = (:var 7)) && (z' = z) && (y' = y) && (x' = x))\nReentrancy property(ies) for :D4:\n((<errorCode> = 0) && ((:var 3) = (:var 7)) && (z' = z) && (y' = y) && (x' = x))\nReentrancy property(ies) for :B:\n((<errorCode> = 0) && ((:var 2) = (:var 5)) && (y' = y) && (x' = x))\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 2) = (:var 5)) && (z' = z) && (x' = x))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 0)\n<errorCode> = 2 -> Assertion failed at assert(x == 1)\n<errorCode> = 3 -> Assertion failed at assert(x == -1)\n<errorCode> = 4 -> Assertion failed at assert(x == 0)\n<errorCode> = 5 -> Assertion failed at assert(x == 1)\n<errorCode> = 6 -> Assertion failed at assert(x == -1)\n<errorCode> = 7 -> Assertion failed at assert(x == 0)\n<errorCode> = 8 -> Assertion failed at assert(x == 1)\n<errorCode> = 9 -> Assertion failed at assert(x == -1)\n<errorCode> = 10 -> Assertion failed at assert(x == 0)\n<errorCode> = 11 -> Assertion failed at assert(x == 1)\n<errorCode> = 12 -> Assertion failed at assert(x == -1)\n
