contract c {
	function f() public pure returns (uint) {
		uint x = 8e130%9;
		assert(x == 8);
		assert(x != 8);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6321: (48-52): Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
// Warning 6328: (96-110): CHC: Assertion violation happens here.\nCounterexample:\n\n = 0\nx = 8\n\nTransaction trace:\nc.constructor()\nc.f()
// Info 1180: Contract invariant(s) for :c:\n(true || true || true)\nReentrancy property(ies) for :c:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 8)\n<errorCode> = 2 -> Assertion failed at assert(x != 8)\n
