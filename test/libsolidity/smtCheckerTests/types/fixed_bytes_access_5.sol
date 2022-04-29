contract C {
	function f() public pure {
		bytes4 x = 0x01020304;
		bytes1 b = 0x02;
		assert(x[0] == b); // fails
		assert(x[1] == b);
		assert(x[2] == b); // fails
		assert(x[3] == b); // fails
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (87-104): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 0x01020304\nb = 0x02\n\nTransaction trace:\nC.constructor()\nC.f()
// Warning 6328: (138-155): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 0x01020304\nb = 0x02\n\nTransaction trace:\nC.constructor()\nC.f()
// Warning 6328: (168-185): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 0x01020304\nb = 0x02\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true)\n(true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n(true || true || true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at x[0]\n<errorCode> = 2 -> Assertion failed at assert(x[0] == b)\n<errorCode> = 3 -> Out of bounds access at x[1]\n<errorCode> = 4 -> Assertion failed at assert(x[1] == b)\n<errorCode> = 5 -> Out of bounds access at x[2]\n<errorCode> = 6 -> Assertion failed at assert(x[2] == b)\n<errorCode> = 7 -> Out of bounds access at x[3]\n<errorCode> = 8 -> Assertion failed at assert(x[3] == b)\n
