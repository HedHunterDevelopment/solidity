contract C
{
	function f(uint x) public pure {
		require(x < 10000);
		uint y = x * 2;
		assert((y % 2) == 0);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at x * 2\n<errorCode> = 2 -> Division by zero at y % 2\n<errorCode> = 4 -> Assertion failed at assert((y % 2) == 0)\n
