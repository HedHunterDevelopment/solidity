contract B {
    function f() mod2("0123456") pure public { }
    modifier mod2(bytes7 a) {
		assert(a == "0123456");
		assert(a == "1234567");
		_;
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (120-142): CHC: Assertion violation happens here.\nCounterexample:\n\na = 0x30313233343536\n\nTransaction trace:\nB.constructor()\nB.f()
// Info 1180: Contract invariant(s) for :B:\n(true || true || true)\nReentrancy property(ies) for :B:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a == "0123456")\n<errorCode> = 2 -> Assertion failed at assert(a == "1234567")\n
