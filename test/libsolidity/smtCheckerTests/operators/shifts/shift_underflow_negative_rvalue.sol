contract C {
    function f(int256 a, uint256 b) internal pure returns (int256) {
        return a << b;
    }

    function g(int256 a, uint256 b) internal pure returns (int256) {
        return a >> b;
    }

	function t() public pure {
		assert(f(1, 2**256 - 1) == 0);
		// Fails because the above is true.
		assert(f(1, 2**256 - 1) == 1);

		assert(g(1, 2**256 - 1) == 0);
		// Fails because the above is true.
		assert(g(1, 2**256 - 1) == 1);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (312-341): CHC: Assertion violation happens here.
// Warning 6328: (417-446): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(f(1, 2**256 - 1) == 0)\n<errorCode> = 2 -> Assertion failed at assert(f(1, 2**256 - 1) == 1)\n<errorCode> = 3 -> Assertion failed at assert(g(1, 2**256 - 1) == 0)\n<errorCode> = 4 -> Assertion failed at assert(g(1, 2**256 - 1) == 1)\n
