contract C  {
	function f(int x, int y) public pure returns (int) {
		require(x + y >= x);
		return x + y;
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 3944: (78-83): CHC: Underflow (resulting value less than -57896044618658097711785492504343953926634992332820282019728792003956564819968) happens here.
// Warning 4984: (78-83): CHC: Overflow (resulting value larger than 0x80 * 2**248 - 1) happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Underflow at x + y\n<errorCode> = 2 -> Overflow at x + y\n<errorCode> = 3 -> Underflow at x + y\n<errorCode> = 4 -> Overflow at x + y\n
