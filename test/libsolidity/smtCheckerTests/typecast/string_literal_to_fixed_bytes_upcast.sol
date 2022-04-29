contract C {
	function f() public pure {
		assert(bytes4(hex"0000ffff") == bytes4(hex"ffff")); // should fail
		assert(bytes4(hex"ffff0000") == bytes4(hex"ffff")); // should hold
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (43-93): CHC: Assertion violation happens here.\nCounterexample:\n\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(bytes4(hex"0000ffff") == bytes4(hex"ffff"))\n<errorCode> = 2 -> Assertion failed at assert(bytes4(hex"ffff0000") == bytes4(hex"ffff"))\n
