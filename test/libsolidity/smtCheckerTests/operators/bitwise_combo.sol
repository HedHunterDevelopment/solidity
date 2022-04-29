contract C {
	function f() public pure {
		uint8 x = 0xff;
		uint8 y = ~x;
		assert(x & y == 0);
		assert(x | y == 0xff);
		assert(x ^ y == 0xff);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x & y == 0)\n<errorCode> = 2 -> Assertion failed at assert(x | y == 0xff)\n<errorCode> = 3 -> Assertion failed at assert(x ^ y == 0xff)\n
