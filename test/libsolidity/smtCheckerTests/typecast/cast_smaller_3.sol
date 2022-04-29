contract C
{
	function f() public pure {
		bytes2 a = 0x1234;
		bytes1 b = bytes1(a); // b will be 0x12
		assert(b == 0x12);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(b == 0x12)\n
