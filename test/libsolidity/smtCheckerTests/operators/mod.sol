contract C {
	function f(int x, int y) public pure {
		require(y == -10);
		require(x == 100);
		int z1 = x % y;
		int z2 = x % -y;
		assert(z1 == z2);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Division by zero at x % y\n<errorCode> = 3 -> Division by zero at x % -y\n<errorCode> = 5 -> Assertion failed at assert(z1 == z2)\n
