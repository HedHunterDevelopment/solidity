contract C {
	uint x = 5;

	constructor(uint a, uint b) {
		assert(x == 5);
		x = a + b;
	}

	function f(uint y) view public {
		assert(y == x);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 4984: (82-87): CHC: Overflow (resulting value larger than 2**256 - 1) happens here.
// Warning 6328: (129-143): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true)\nReentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(y == x)\n<errorCode> = 3 -> Assertion failed at assert(x == 5)\n<errorCode> = 4 -> Overflow at a + b\n
