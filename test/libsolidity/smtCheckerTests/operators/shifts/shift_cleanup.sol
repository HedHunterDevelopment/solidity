contract C {
	function f() public pure returns (uint16 x) {
		unchecked {
			x = 0xffff;
			x += 32;
			x = x << 8;
			x = x >> 16;
		}
		assert(x == 0);
		// Fails because x = 0.
		assert(x == 10);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6328: (182-197): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 0)\n<errorCode> = 2 -> Assertion failed at assert(x == 10)\n
