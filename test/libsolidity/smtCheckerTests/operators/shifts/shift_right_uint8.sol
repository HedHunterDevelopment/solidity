contract C {
    function f(uint8 a, uint8 b) internal pure returns (uint256) {
        return a >> b;
    }
	function t() public pure {
		assert(f(0x66, 0) == 0x66);
		// Fails because the above is true.
		assert(f(0x66, 0) == 0x6);

		assert(f(0x66, 8) == 0);
		// Fails because the above is true.
		assert(f(0x66, 8) == 1);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (207-232): CHC: Assertion violation happens here.
// Warning 6328: (302-325): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(f(0x66, 0) == 0x66)\n<errorCode> = 2 -> Assertion failed at assert(f(0x66, 0) == 0x6)\n<errorCode> = 3 -> Assertion failed at assert(f(0x66, 8) == 0)\n<errorCode> = 4 -> Assertion failed at assert(f(0x66, 8) == 1)\n
