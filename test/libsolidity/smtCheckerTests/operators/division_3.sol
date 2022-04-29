contract C {
	function f(int x, int y) public pure returns (int) {
		require(y != 0);
		return x / y;
	}
}
// ====
// SMTEngine: all
// ----
// Warning 4984: (95-100): CHC: Overflow (resulting value larger than 0x80 * 2**248 - 1) happens here.\nCounterexample:\n\nx = (- 57896044618658097711785492504343953926634992332820282019728792003956564819968)\ny = (- 1)\n = 0\n\nTransaction trace:\nC.constructor()\nC.f((- 57896044618658097711785492504343953926634992332820282019728792003956564819968), (- 1))
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Division by zero at x / y\n<errorCode> = 3 -> Overflow at x / y\n
