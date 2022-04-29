contract C {
	uint[2] a;
	function f() public view {
		assert(a.length == 2); // should hold
		assert(a.length < 2); // should fail
		assert(a.length > 2); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (95-115): CHC: Assertion violation happens here.\nCounterexample:\na = [0, 0]\n\nTransaction trace:\nC.constructor()\nState: a = [0, 0]\nC.f()
// Warning 6328: (134-154): CHC: Assertion violation happens here.\nCounterexample:\na = [0, 0]\n\nTransaction trace:\nC.constructor()\nState: a = [0, 0]\nC.f()
// Info 1180: Contract invariant(s) for :C:\n((!(a.length <= 1) && !(a.length >= 3)) || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a)) || true || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a.length == 2)\n<errorCode> = 2 -> Assertion failed at assert(a.length < 2)\n<errorCode> = 3 -> Assertion failed at assert(a.length > 2)\n
