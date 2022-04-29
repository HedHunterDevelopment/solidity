contract C {
	uint x = 2;
}

contract D is C {
	constructor() {
		assert(x == 2);
		assert(x == 3);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (84-98): CHC: Assertion violation happens here.\nCounterexample:\nx = 2\n\nTransaction trace:\nD.constructor()
// Info 1180: Contract invariant(s) for :C:\n(true || true)\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :D:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 2)\n<errorCode> = 2 -> Assertion failed at assert(x == 3)\n
