contract B {
	uint x = 5;
}

contract C is B {
	constructor() {
		assert(x == 5);
		x = 10;
	}

	function f(uint y) public view {
		assert(y == x);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6328: (132-146): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :B:\n(true || true)\nContract invariant(s) for :C:\n(true || true || true || true)\nReentrancy property(ies) for :B:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(y == x)\n<errorCode> = 3 -> Assertion failed at assert(x == 5)\n
