pragma abicoder               v2;

contract C {
	struct S {
		uint x;
		uint[] a;
	}
	S s1;
	function g(S memory s2) public {
		s1.x = s2.x;
		s1.a = s2.a;
	}
	function f(S memory s2) public {
		delete s1;
		assert(s1.x == s2.x);
		assert(s1.a.length == s2.a.length);
		assert(s1.a.length == 0);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6328: (208-228): CHC: Assertion violation happens here.
// Warning 6328: (232-266): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true)\nReentrancy property(ies) for :C:\n(true || true || true || true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (s1' = s1)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(s1.x == s2.x)\n<errorCode> = 2 -> Assertion failed at assert(s1.a.length == s2.a.length)\n<errorCode> = 3 -> Assertion failed at assert(s1.a.length == 0)\n
