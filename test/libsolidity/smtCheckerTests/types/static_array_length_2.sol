contract C {
	function f() public pure returns (address[2] memory a) {
		assert(a.length == 2); // should hold
		assert(a.length < 2); // should fail
		assert(a.length > 2); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (113-133): CHC: Assertion violation happens here.\nCounterexample:\n\na = [0x0, 0x0]\n\nTransaction trace:\nC.constructor()\nC.f()
// Warning 6328: (152-172): CHC: Assertion violation happens here.\nCounterexample:\n\na = [0x0, 0x0]\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a.length == 2)\n<errorCode> = 2 -> Assertion failed at assert(a.length < 2)\n<errorCode> = 3 -> Assertion failed at assert(a.length > 2)\n
