contract C
{
	function f() public pure {
		uint32 a = 0x12345678;
		uint16 b = uint16(a); // b will be 0x5678 now
		assert(b == 0x5678);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(b == 0x5678)\n
