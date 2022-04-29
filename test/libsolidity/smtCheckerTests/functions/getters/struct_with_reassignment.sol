contract C {
	struct S {
		uint x;
		bool b;
	}

	S public s;

	constructor() {
		s.x = 1;
		s.b = false;
	}

	function f() public {
		uint x;
		bool b;
		(x,b) = this.s();
		assert(x == s.x); // this should hold
		assert(b == s.b); // this should hold
		assert(b == true); // this should fail
		s.x = 42;
		(uint y, bool c) = this.s();
		assert(c == b); // this should hold
		assert(y == x); // this should fail

	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (255-272): CHC: Assertion violation happens here.\nCounterexample:\ns = {x: 1, b: false}\nx = 1\nb = false\ny = 0\nc = false\n\nTransaction trace:\nC.constructor()\nState: s = {x: 1, b: false}\nC.f()
// Warning 6328: (377-391): CHC: Assertion violation happens here.\nCounterexample:\ns = {x: 42, b: false}\nx = 1\nb = false\ny = 42\nc = false\n\nTransaction trace:\nC.constructor()\nState: s = {x: 1, b: false}\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 1) = (:var 3)) && (s' = s)) || true || true || true || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (s' = s)) || true || true || true || true)\n(true || true || true || true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (s' = s)))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == s.x)\n<errorCode> = 2 -> Assertion failed at assert(b == s.b)\n<errorCode> = 3 -> Assertion failed at assert(b == true)\n<errorCode> = 4 -> Assertion failed at assert(c == b)\n<errorCode> = 5 -> Assertion failed at assert(y == x)\n
