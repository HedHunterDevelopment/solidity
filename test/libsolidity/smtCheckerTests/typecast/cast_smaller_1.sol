contract C
{
	function f(uint16 x) public pure {
		uint8 y = uint8(x);
		// True because of y's type
		assert(y < 300);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(y < 300)\n
