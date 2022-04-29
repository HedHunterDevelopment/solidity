contract C
{
	function f(uint8 x) public pure returns (uint8) {
		x = 100;
		uint8 y = x * 3;
		assert(y == 44);
		x = 128;
		y = x * 4;
		assert(y == 0);
		return y;
	}
}
// ====
// SMTEngine: all
// ----
// Warning 4984: (87-92): CHC: Overflow (resulting value larger than 255) happens here.\nCounterexample:\n\nx = 100\n = 0\ny = 0\n\nTransaction trace:\nC.constructor()\nC.f(0)
// Info 1180: Reentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at x * 3\n<errorCode> = 2 -> Assertion failed at assert(y == 44)\n<errorCode> = 3 -> Overflow at x * 4\n<errorCode> = 4 -> Assertion failed at assert(y == 0)\n
