contract C {
	function f() public pure {
		bytes memory b = bytes(hex"ffff");
		assert(b.length == 2); // should hold
		assert(b[0] == bytes1(uint8(255))); // should hold
		assert(b[1] == bytes1(uint8(100))); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (173-207): CHC: Assertion violation happens here.\nCounterexample:\n\nb = [0xff, 0xff]\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(b.length == 2)\n<errorCode> = 2 -> Out of bounds access at b[0]\n<errorCode> = 3 -> Assertion failed at assert(b[0] == bytes1(uint8(255)))\n<errorCode> = 4 -> Out of bounds access at b[1]\n<errorCode> = 5 -> Assertion failed at assert(b[1] == bytes1(uint8(100)))\n
