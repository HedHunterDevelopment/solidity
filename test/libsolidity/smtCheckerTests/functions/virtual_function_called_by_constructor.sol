contract A {
    uint public x;
    function v() internal virtual {
        x = 2;
    }
    constructor() {
        v();
    }
	function i() public view virtual {
		assert(x == 2); // should hold
		assert(x == 10); // should fail
	}
}

contract C is A {
    function v() internal override {
        x = 10;
    }
	function i() public view override {
		assert(x == 10); // should hold
		assert(x == 2); // should fail
	}
}
// ====
// SMTEngine: all
// SMTIgnoreOS: macos
// ----
// Warning 6328: (199-214): CHC: Assertion violation happens here.\nCounterexample:\nx = 2\n\nTransaction trace:\nA.constructor()\nState: x = 2\nA.i()
// Warning 6328: (387-401): CHC: Assertion violation happens here.\nCounterexample:\nx = 10\n\nTransaction trace:\nC.constructor()\nState: x = 10\nC.i()
// Info 1180: Contract invariant(s) for :A:\n((!(x <= 1) && !(x >= 3)) || true)\n(true || true || true)\nContract invariant(s) for :C:\n((!(x >= 11) && !(x <= 9)) || true)\n(true || true || true)\nReentrancy property(ies) for :A:\n(((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 2)\n<errorCode> = 2 -> Assertion failed at assert(x == 10)\n<errorCode> = 4 -> Assertion failed at assert(x == 2)\n<errorCode> = 5 -> Assertion failed at assert(x == 10)\n<errorCode> = 6 -> Assertion failed at assert(x == 10)\n<errorCode> = 7 -> Assertion failed at assert(x == 2)\n
