contract C {
	function f() public pure returns (bytes1) {
		bytes1 b = (bytes1(0x0F) | (bytes1(0xF0)));
		assert(b == bytes1(0xFF)); // should hold
		assert(b == bytes1(0x00)); // should fail
		return b;
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (150-175): CHC: Assertion violation happens here.\nCounterexample:\n\n = 0x0\nb = 0xff\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(b == bytes1(0xFF))\n<errorCode> = 2 -> Assertion failed at assert(b == bytes1(0x00))\n
