contract C {
	function f() public pure returns(int) {
		int a;
		(,, a) = ((((((1, 3, (((((2)))))))))));
		assert(a == 2);
		assert(a == 3);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6321: (47-50): Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
// Warning 6328: (125-139): CHC: Assertion violation happens here.\nCounterexample:\n\n = 0\na = 2\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a == 2)\n<errorCode> = 2 -> Assertion failed at assert(a == 3)\n
