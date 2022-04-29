contract C {
	uint[2] a;
	uint x = f();
	constructor() {
		assert(a.length == 2); // should hold
		assert(x == 2); // should hold
		assert(a.length < 2); // should fail
		assert(a.length > 2); // should fail
	}
	function f() internal view returns (uint) {
		assert(a.length == 2); // should hold
		assert(a.length < 2); // should fail
		assert(a.length > 2); // should fail
		return a.length;
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (132-152): CHC: Assertion violation happens here.\nCounterexample:\na = [0, 0], x = 2\n\nTransaction trace:\nC.constructor()
// Warning 6328: (171-191): CHC: Assertion violation happens here.\nCounterexample:\na = [0, 0], x = 2\n\nTransaction trace:\nC.constructor()
// Warning 6328: (298-318): CHC: Assertion violation happens here.\nCounterexample:\na = [0, 0], x = 0\n\nTransaction trace:\nC.constructor()
// Warning 6328: (337-357): CHC: Assertion violation happens here.\nCounterexample:\na = [0, 0], x = 0\n\nTransaction trace:\nC.constructor()
// Info 1180: Contract invariant(s) for :C:\n(true || true)\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 2) = (:var 5)) && (a' = a) && (x' = x))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a.length == 2)\n<errorCode> = 2 -> Assertion failed at assert(a.length < 2)\n<errorCode> = 3 -> Assertion failed at assert(a.length > 2)\n<errorCode> = 4 -> Assertion failed at assert(a.length == 2)\n<errorCode> = 5 -> Assertion failed at assert(x == 2)\n<errorCode> = 6 -> Assertion failed at assert(a.length < 2)\n<errorCode> = 7 -> Assertion failed at assert(a.length > 2)\n
