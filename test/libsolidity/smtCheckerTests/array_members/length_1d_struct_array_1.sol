contract C {
	struct S {
		uint[] arr;
	}
	S s1;
	S s2;
	function f() public view {
		assert(s1.arr.length == s2.arr.length);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n((((s1.arr.length + ((- 1) * s2.arr.length)) >= 0) && ((s1.arr.length + ((- 1) * s2.arr.length)) <= 0)) || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 2) = (:var 5)) && (s1' = s1) && (s2' = s2)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(s1.arr.length == s2.arr.length)\n
