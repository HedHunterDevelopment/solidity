contract C {

	struct S {
		uint x;
	}

	struct T {
		S s;
		uint y;
	}

	function test() pure public {
		assert(T(S(42), 1).s.x == 42);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(T(S(42), 1).s.x == 42)\n
