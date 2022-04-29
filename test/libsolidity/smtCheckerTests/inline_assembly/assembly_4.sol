contract C {
	function f() public pure returns (bool) {
		bool b;
		int x = 42;
		assembly { b := 1 }
		b = true;
		assert(x == 42); // should hold
		assert(b); // should hold
		return b;
	}
}
// ====
// SMTEngine: all
// ----
// Warning 7737: (82-101): Inline assembly may cause SMTChecker to produce spurious warnings (false positives).
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 42)\n<errorCode> = 2 -> Assertion failed at assert(b)\n
