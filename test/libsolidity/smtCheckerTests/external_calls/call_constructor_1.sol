contract C {
	uint x;
	constructor(address _a) {
		_a.call("aaaa");
		assert(x == 0); // should hold
	}
}
// ====
// SMTEngine: all
// ----
// Warning 9302: (51-66): Return value of low-level calls not used.
// Info 1180: Contract invariant(s) for :C:\n(true || true)\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 0)\n
