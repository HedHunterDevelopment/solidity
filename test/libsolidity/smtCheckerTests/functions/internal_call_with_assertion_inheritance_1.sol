contract A {
	uint x;
	function f() internal {
		assert(x == 1);
		--x;
	}
}

contract C is A {
	constructor() {
		assert(x == 0);
		++x;
		f();
		assert(x == 0);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :A:\n(true || true)\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 1)\n<errorCode> = 2 -> Underflow at --x\n<errorCode> = 3 -> Assertion failed at assert(x == 1)\n<errorCode> = 4 -> Underflow at --x\n<errorCode> = 5 -> Assertion failed at assert(x == 0)\n<errorCode> = 6 -> Overflow at ++x\n<errorCode> = 7 -> Assertion failed at assert(x == 0)\n
