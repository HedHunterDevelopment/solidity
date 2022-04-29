contract C {
	function f(uint b) public pure {
		require(b < 3);
		uint c = (b > 0) ? b++ : ++b;
		assert(c == 0);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6328: (99-113): CHC: Assertion violation happens here.
// Info 1180: Reentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at b++\n<errorCode> = 2 -> Overflow at ++b\n<errorCode> = 3 -> Assertion failed at assert(c == 0)\n
