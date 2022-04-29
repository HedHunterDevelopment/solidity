contract C {
	function test_addmod(uint x, uint y) public pure {
		require(x % 13 == 0);
		require(y % 13 == 0);

		uint z = addmod(x, y, 13);
		assert(z == 0);
	}
	function test_mulmod(uint x, uint y) public pure {
		require(x % 13 == 0);
		require(y % 13 == 0);

		uint z = mulmod(x, y, 13);
		assert(z == 0);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true)\n(true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true)\n(true || true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Division by zero at x % 13\n<errorCode> = 3 -> Division by zero at y % 13\n<errorCode> = 5 -> Division by zero at addmod(x, y, 13)\n<errorCode> = 7 -> Assertion failed at assert(z == 0)\n<errorCode> = 9 -> Division by zero at x % 13\n<errorCode> = 11 -> Division by zero at y % 13\n<errorCode> = 13 -> Division by zero at mulmod(x, y, 13)\n<errorCode> = 15 -> Assertion failed at assert(z == 0)\n
