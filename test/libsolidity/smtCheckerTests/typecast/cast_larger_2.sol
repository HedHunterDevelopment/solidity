contract C
{
	function f() public pure {
		uint16 a = 0x1234;
		uint32 b = uint32(a); // b will be 0x00001234 now
		// This is correct (left padding).
		assert(a == b);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a == b)\n
