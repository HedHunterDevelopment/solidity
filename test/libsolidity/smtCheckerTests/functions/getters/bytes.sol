contract C {
	bytes public str2 = 'c';

	function f() public view {
		bytes memory a2 = this.str2();
		assert(keccak256(a2) == keccak256(str2)); // should hold
		assert(keccak256(a2) == keccak256('a')); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 1218: (162-201): CHC: Error trying to invoke SMT solver.
// Warning 6328: (162-201): CHC: Assertion violation might happen here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (str2' = str2)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(keccak256(a2) == keccak256(str2))\n<errorCode> = 2 -> Assertion failed at assert(keccak256(a2) == keccak256('a'))\n
// Warning 4661: (162-201): BMC: Assertion violation happens here.
