contract C {
	function f(int x, int y) public pure {
		require(y != 0);
		require(x == 42);
		int z1 = x % y;
		int z2 = -x % y;
		assert(z1 == -z2);
		assert((x >= 0 && z1 >=0) || (x <= 0 && z1 <= 0));
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (131-148): CHC: Assertion violation might happen here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Division by zero at x % y\n<errorCode> = 3 -> Division by zero at -x % y\n<errorCode> = 5 -> Assertion failed at assert(z1 == -z2)\n<errorCode> = 6 -> Assertion failed at assert((x >= 0 && z1 >=0) || (x <= 0 && z1 <= 0))\n
