contract C {
	function f(int x, int y) public pure returns (int) {
		require(y != 0);
		require(y != -1);
		return x / y;
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Division by zero at x / y\n<errorCode> = 3 -> Overflow at x / y\n
