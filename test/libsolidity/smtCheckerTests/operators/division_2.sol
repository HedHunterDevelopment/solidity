contract C {
	function f(uint x, uint y) public pure returns (uint) {
		require(y != 0);
		return x / y;
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Division by zero at x / y\n
