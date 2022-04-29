contract C
{
	function f() public pure {
		bytes2 a = 0x1234;
		bytes4 b = bytes4(a); // b will be 0x12340000
		// False positive since right padding is not supported yet.
		assert(b == 0x12340000);
		// This should fail (right padding).
		assert(a == b);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (240-254): CHC: Assertion violation happens here.\nCounterexample:\n\na = 0x1234\nb = 0x12340000\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(b == 0x12340000)\n<errorCode> = 2 -> Assertion failed at assert(a == b)\n
