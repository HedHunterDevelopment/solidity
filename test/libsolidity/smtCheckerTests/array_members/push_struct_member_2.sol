contract C {
	struct S {
		int[] b;
	}
	S s;
	struct T {
		S[] s;
	}
	T t;
	function f() public {
		s.b.push();
		t.s.push();
		t.s[0].b.push();
	}
}

// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 2) = (:var 5)) && (s' = s) && (t' = t)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at t.s[0]\n
