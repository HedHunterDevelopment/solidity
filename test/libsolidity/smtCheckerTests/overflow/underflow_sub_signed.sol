contract C
{
	function f(int8 x) public pure returns (int8) {
		x = -2;
		int8 y;
		unchecked { y = x - 127; }
		assert(y == 127);
		x = -128;
		unchecked { y = x - 127; }
		assert(y == 1);
		x = 127;
		unchecked { y = x - (-127); }
		assert(y == -2);
		return y;
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(y == 127)\n<errorCode> = 3 -> Assertion failed at assert(y == 1)\n<errorCode> = 5 -> Assertion failed at assert(y == -2)\n
