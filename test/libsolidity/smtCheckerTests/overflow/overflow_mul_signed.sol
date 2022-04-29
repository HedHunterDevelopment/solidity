contract C
{
	function f(int8 x) public pure returns (int8) {
		x = 100;
		int8 y;
		unchecked { y = x * 2; }
		assert(y == -56);
		y = x * 100;
		assert(y == 16);
		return y;
	}
}
// ====
// SMTEngine: all
// ----
// Warning 4984: (136-143): CHC: Overflow (resulting value larger than 127) happens here.\nCounterexample:\n\nx = 100\n = 0\ny = (- 56)\n\nTransaction trace:\nC.constructor()\nC.f(0)
// Info 1180: Reentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(y == -56)\n<errorCode> = 2 -> Underflow at x * 100\n<errorCode> = 3 -> Overflow at x * 100\n<errorCode> = 4 -> Assertion failed at assert(y == 16)\n
