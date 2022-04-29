contract C {
	bytes1 public x;
	bytes3 public y;

	function f() public view {
		bytes1 a = this.x();
		bytes3 b = this.y();
		assert(a == x); // should hold
		assert(a == 'a'); // should fail
		assert(b == y); // should hold
		assert(y == "abc"); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (159-175): CHC: Assertion violation happens here.\nCounterexample:\nx = 0x0, y = 0x0\na = 0x0\nb = 0x0\n\nTransaction trace:\nC.constructor()\nState: x = 0x0, y = 0x0\nC.f()
// Warning 6328: (227-245): CHC: Assertion violation happens here.\nCounterexample:\nx = 0x0, y = 0x0\na = 0x0\nb = 0x0\n\nTransaction trace:\nC.constructor()\nState: x = 0x0, y = 0x0\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 2) = (:var 5)) && (x' = x) && (y' = y)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a == x)\n<errorCode> = 2 -> Assertion failed at assert(a == 'a')\n<errorCode> = 3 -> Assertion failed at assert(b == y)\n<errorCode> = 4 -> Assertion failed at assert(y == "abc")\n
