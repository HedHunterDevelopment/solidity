contract A {
	uint public x = 42;
	constructor(uint) {}

	function f() internal returns (uint) {
		x = x + 1;
		return x;
	}
}

contract C is A {
	constructor() A(f()) {
		assert(x == 42);
		assert(x == 0); // should fail
		assert(x == 1); // should fail
		assert(x > 2000); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (191-205): CHC: Assertion violation happens here.\nCounterexample:\nx = 42\n\nTransaction trace:\nC.constructor()
// Warning 6328: (224-238): CHC: Assertion violation happens here.\nCounterexample:\nx = 42\n\nTransaction trace:\nC.constructor()
// Warning 6328: (257-273): CHC: Assertion violation happens here.\nCounterexample:\nx = 42\n\nTransaction trace:\nC.constructor()
// Info 1180: Contract invariant(s) for :A:\n(true || true)\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at x + 1\n<errorCode> = 2 -> Overflow at x + 1\n<errorCode> = 3 -> Assertion failed at assert(x == 42)\n<errorCode> = 4 -> Assertion failed at assert(x == 0)\n<errorCode> = 5 -> Assertion failed at assert(x == 1)\n<errorCode> = 6 -> Assertion failed at assert(x > 2000)\n
