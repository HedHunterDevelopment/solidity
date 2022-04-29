contract C {

	struct S {
		uint x;
	}

	S s = S(42);

	function test() view public {
		assert(s.x == 42);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n((!(s.x <= 41) && !(s.x >= 43)) || true)\nReentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (s' = s)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(s.x == 42)\n
