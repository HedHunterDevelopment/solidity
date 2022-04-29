contract A {
	uint x;
	function f() internal {
		assert(x == 2);
		--x;
	}
}

contract C is A {
	constructor() {
		assert(x == 1);
		++x;
		f();
		assert(x == 1);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (49-63): CHC: Assertion violation happens here.\nCounterexample:\nx = 1\n\nTransaction trace:\nC.constructor()
// Warning 6328: (115-129): CHC: Assertion violation happens here.\nCounterexample:\nx = 0\n\nTransaction trace:\nC.constructor()
// Warning 6328: (147-161): CHC: Assertion violation happens here.\nCounterexample:\nx = 0\n\nTransaction trace:\nC.constructor()
// Info 1180: Contract invariant(s) for :A:\n(true || true)\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 2)\n<errorCode> = 2 -> Underflow at --x\n<errorCode> = 3 -> Assertion failed at assert(x == 2)\n<errorCode> = 4 -> Underflow at --x\n<errorCode> = 5 -> Assertion failed at assert(x == 1)\n<errorCode> = 6 -> Overflow at ++x\n<errorCode> = 7 -> Assertion failed at assert(x == 1)\n
