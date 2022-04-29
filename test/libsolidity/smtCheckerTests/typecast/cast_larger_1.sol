contract C
{
	function f(uint8 x) public pure {
		uint16 y = uint16(x);
		// True because of x's type
		assert(y < 300);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(y < 300)\n
