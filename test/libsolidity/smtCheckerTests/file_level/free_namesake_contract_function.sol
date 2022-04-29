function f() pure returns (uint) { return 1337; }

contract C {
	function g() public pure {
		assert(f() == 42); // should hold
		assert(f() == 1337); // should fail
	}
	function f() internal pure returns (uint) { return 42; }
}
// ====
// SMTEngine: all
// ----
// Warning 2519: (170-226): This declaration shadows an existing declaration.
// Warning 6328: (130-149): CHC: Assertion violation happens here.\nCounterexample:\n\n\nTransaction trace:\nC.constructor()\nC.g()\n    C.f() -- internal call\n    C.f() -- internal call
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(f() == 42)\n<errorCode> = 2 -> Assertion failed at assert(f() == 1337)\n
