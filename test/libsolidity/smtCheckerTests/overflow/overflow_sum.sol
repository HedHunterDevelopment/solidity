contract C
{
	function f(uint8 x) public pure returns (uint8) {
		uint8 y;
		unchecked { y = x + 255; }
		require(y >= x);
		x = 255;
		unchecked { y = x + 1; }
		assert(y == 0);
		y = x + 255;
		assert(y == 254);
		return y;
	}
}
// ====
// SMTEngine: all
// ----
// Warning 4984: (185-192): CHC: Overflow (resulting value larger than 255) happens here.\nCounterexample:\n\nx = 255\n = 0\ny = 0\n\nTransaction trace:\nC.constructor()\nC.f(0)
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 2 -> Assertion failed at assert(y == 0)\n<errorCode> = 3 -> Overflow at x + 255\n<errorCode> = 4 -> Assertion failed at assert(y == 254)\n
