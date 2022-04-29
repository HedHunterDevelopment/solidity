contract C {

	struct S {
		uint x;
	}

	struct T {
		S s;
		uint y;
	}

	function test() pure public {
		S memory inner = S({x: 43});
		T memory outer = T({y: 512, s: inner});
		assert(outer.y == 512);
		assert(outer.s.x == 43);
		assert(outer.s.x == 42);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (232-255): CHC: Assertion violation happens here.\nCounterexample:\n\ninner = {x: 43}\nouter = {s: {x: 43}, y: 512}\n\nTransaction trace:\nC.constructor()\nC.test()
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(outer.y == 512)\n<errorCode> = 2 -> Assertion failed at assert(outer.s.x == 43)\n<errorCode> = 3 -> Assertion failed at assert(outer.s.x == 42)\n
