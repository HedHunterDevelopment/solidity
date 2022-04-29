pragma abicoder               v2;

contract C {
	struct S {
		uint x;
		uint[] a;
	}
	function f(S memory s1, S memory s2) public pure {
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
// Warning 6328: (152-172): CHC: Assertion violation happens here.
// Warning 6328: (176-210): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(s1.x == s2.x)\n<errorCode> = 2 -> Assertion failed at assert(s1.a.length == s2.a.length)\n<errorCode> = 3 -> Assertion failed at assert(s1.a.length == 0)\n
