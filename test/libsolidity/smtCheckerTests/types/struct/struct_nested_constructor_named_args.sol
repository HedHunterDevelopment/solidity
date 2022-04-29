contract C {
	struct B { uint b1; }
	struct A { uint a1; B a2; }
	function f() public pure {
		A memory a = A({ a1: 1, a2: B({b1: 2}) });
		assert(a.a1 == 1 && a.a2.b1 == 2);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a.a1 == 1 && a.a2.b1 == 2)\n
