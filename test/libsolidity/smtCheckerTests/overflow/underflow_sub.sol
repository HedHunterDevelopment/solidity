contract C
{
	function f(uint8 x) public pure returns (uint) {
		x = 0;
		uint8 y;
		unchecked { y = x - 1; }
		assert(y == 255);
		unchecked { y = x - 255; }
		assert(y == 1);
		return y;
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(y == 255)\n<errorCode> = 3 -> Assertion failed at assert(y == 1)\n
