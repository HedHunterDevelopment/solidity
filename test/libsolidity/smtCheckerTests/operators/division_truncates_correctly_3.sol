contract C {
	function f(int x, int y) public pure {
		x = -7;
		y = 2;
		assert(x / y == -3);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Division by zero at x / y\n<errorCode> = 3 -> Overflow at x / y\n<errorCode> = 4 -> Assertion failed at assert(x / y == -3)\n
