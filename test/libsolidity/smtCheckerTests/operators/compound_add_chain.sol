contract C
{
	function f() public pure {
		uint a = 1;
		uint b = 3;
		uint c = 7;
		a += b += c;
		assert(b ==  10 && a == 11);
		a += (b += c);
		assert(b ==  17 && a == 28);
		a += a += a;
		assert(a == 112);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at b += c\n<errorCode> = 2 -> Overflow at a += b += c\n<errorCode> = 3 -> Assertion failed at assert(b ==  10 && a == 11)\n<errorCode> = 4 -> Overflow at b += c\n<errorCode> = 5 -> Overflow at a += (b += c)\n<errorCode> = 6 -> Assertion failed at assert(b ==  17 && a == 28)\n<errorCode> = 7 -> Overflow at a += a\n<errorCode> = 8 -> Overflow at a += a += a\n<errorCode> = 9 -> Assertion failed at assert(a == 112)\n
