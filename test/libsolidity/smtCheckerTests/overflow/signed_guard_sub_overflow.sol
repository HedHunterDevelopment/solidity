contract C  {
	function f(int x, int y) public pure returns (int) {
		require(x >= y);
		return x - y;
	}
}
// ====
// SMTEngine: all
// SMTIgnoreOS: macos
// ----
// Warning 4984: (96-101): CHC: Overflow (resulting value larger than 0x80 * 2**248 - 1) happens here.\nCounterexample:\n\nx = 0\ny = (- 57896044618658097711785492504343953926634992332820282019728792003956564819968)\n = 0\n\nTransaction trace:\nC.constructor()\nC.f(0, (- 57896044618658097711785492504343953926634992332820282019728792003956564819968))
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Underflow at x - y\n<errorCode> = 2 -> Overflow at x - y\n
