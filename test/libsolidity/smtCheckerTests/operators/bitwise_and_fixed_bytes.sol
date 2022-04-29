contract C {
	function f() public pure {
		assert(bytes1("") & ("") == bytes1(0)); // should hold
		assert(bytes1(0xAA) & bytes1(0x55) == bytes1(0)); // should hold
		assert(bytes1(0xFF) & bytes1(0xAA) == bytes1(0xAA)); // should hold
		assert(bytes1(0xFF) & bytes1(0xAA) == bytes1(0)); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (237-285): CHC: Assertion violation happens here.\nCounterexample:\n\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(bytes1("") & ("") == bytes1(0))\n<errorCode> = 2 -> Assertion failed at assert(bytes1(0xAA) & bytes1(0x55) == bytes1(0))\n<errorCode> = 3 -> Assertion failed at assert(bytes1(0xFF) & bytes1(0xAA) == bytes1(0xAA))\n<errorCode> = 4 -> Assertion failed at assert(bytes1(0xFF) & bytes1(0xAA) == bytes1(0))\n
