contract C {
	uint x;

	constructor() {
		assert(x == 0);
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
// Warning 6328: (108-122): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true)\nReentrancy property(ies) for :C:\n(true || true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(y == x)\n<errorCode> = 3 -> Assertion failed at assert(x == 0)\n
