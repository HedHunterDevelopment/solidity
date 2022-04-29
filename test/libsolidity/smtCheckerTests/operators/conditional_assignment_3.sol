contract C {
	function f(uint a, uint b) public pure {
		require(a < 10);
		require(b <= a);

		uint c = (b > 4) ? a++ : b++;
		assert(c > a);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6328: (128-141): CHC: Assertion violation happens here.
// Info 1180: Reentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at a++\n<errorCode> = 2 -> Overflow at b++\n<errorCode> = 3 -> Assertion failed at assert(c > a)\n
