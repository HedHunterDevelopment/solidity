contract C  {
	function f(uint x, uint y) public pure returns (uint) {
		require(x >= y);
		return x - y;
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Underflow at x - y\n
