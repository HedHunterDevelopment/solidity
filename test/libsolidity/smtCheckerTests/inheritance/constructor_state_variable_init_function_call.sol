contract C {
	uint x = f(2);
	constructor () {
		assert(x == 2);
	}

	function f(uint y) internal view returns (uint) {
		assert(y > 0);
		assert(x == 0);
		return y;
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true)\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(y > 0)\n<errorCode> = 2 -> Assertion failed at assert(x == 0)\n<errorCode> = 3 -> Assertion failed at assert(x == 2)\n
