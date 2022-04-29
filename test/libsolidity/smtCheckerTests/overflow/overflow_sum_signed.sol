contract C
{
	function f(int8 x) public pure {
		x = 127;
		int8 y;
		unchecked { y = x + 1; }
		assert(y == -128);
		unchecked { y = x + 127; }
		assert(y == -2);
		x = -127;
		unchecked { y = x + -127; }
		assert(y == 2);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(y == -128)\n<errorCode> = 3 -> Assertion failed at assert(y == -2)\n<errorCode> = 5 -> Assertion failed at assert(y == 2)\n
