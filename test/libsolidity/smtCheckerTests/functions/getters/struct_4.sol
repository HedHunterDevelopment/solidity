contract D {
}

contract C {
	struct S {
		D d;
		function () external returns (uint) f;
	}

	S public s;

	function test() public view {
		(D d, function () external returns (uint) f) = this.s();
		assert(d == s.d); // should hold
		assert(address(d) == address(this)); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 2072: (146-183): Unused local variable.
// Warning 6328: (234-269): CHC: Assertion violation happens here.\nCounterexample:\ns = {d: 0, f: 0}\nd = 0\nf = 0\n\nTransaction trace:\nC.constructor()\nState: s = {d: 0, f: 0}\nC.test()
// Info 1180: Contract invariant(s) for :D:\n(true || true)\nContract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :D:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (s' = s)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(d == s.d)\n<errorCode> = 2 -> Assertion failed at assert(address(d) == address(this))\n
