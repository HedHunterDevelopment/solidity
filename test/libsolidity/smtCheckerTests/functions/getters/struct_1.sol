pragma abicoder v2;

contract C {
	struct T {
		uint t;
	}
	struct S {
		uint x;
		T t;
		bool b;
		uint[] a;
	}

	S public s;

	function f() public view {
		uint y;
		bool c;
		T memory t;
		(y,t,c) = this.s();
		assert(y == s.x); // this should hold
		assert(c == s.b); // this should hold
		assert(t.t == s.t.t); // this should hold
		assert(c == true); // this should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (338-355): CHC: Assertion violation happens here.\nCounterexample:\ns = {x: 0, t: {t: 0}, b: false, a: []}\ny = 0\nc = false\nt = {t: 0}\n\nTransaction trace:\nC.constructor()\nState: s = {x: 0, t: {t: 0}, b: false, a: []}\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (s' = s)) || true || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (s' = s)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(y == s.x)\n<errorCode> = 2 -> Assertion failed at assert(c == s.b)\n<errorCode> = 3 -> Assertion failed at assert(t.t == s.t.t)\n<errorCode> = 4 -> Assertion failed at assert(c == true)\n
