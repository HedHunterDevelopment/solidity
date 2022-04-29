abstract contract A {
	bool s;

	function f() public view mod {
		assert(s); // holds for B
		assert(!s); // fails for B
	}
	modifier mod() virtual;
}

contract B is A {
	modifier mod() virtual override {
		bool x = true;
		s = x;
		_;
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (94-104): CHC: Assertion violation happens here.\nCounterexample:\ns = true\nx = true\n\nTransaction trace:\nB.constructor()\nState: s = false\nA.f()
// Info 1180: Contract invariant(s) for :B:\n(true || true || true)\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (s' = s))\nReentrancy property(ies) for :B:\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (s' = s)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(s)\n<errorCode> = 2 -> Assertion failed at assert(!s)\n
