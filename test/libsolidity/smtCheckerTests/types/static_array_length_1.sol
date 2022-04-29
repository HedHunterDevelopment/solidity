contract C {
	function f(address[2] memory a) public pure {
		assert(a.length == 2); // should hold
		assert(a.length < 2); // should fail
		assert(a.length > 2); // should fail
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6328: (102-122): CHC: Assertion violation happens here.
// Warning 6328: (141-161): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a.length == 2)\n<errorCode> = 2 -> Assertion failed at assert(a.length < 2)\n<errorCode> = 3 -> Assertion failed at assert(a.length > 2)\n
