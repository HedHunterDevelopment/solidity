contract C {
	string public str1 = 'b';

	function f() public view {
		string memory a1 = this.str1();
		assert(keccak256(bytes(a1)) == keccak256(bytes(str1))); // should hold
		assert(keccak256(bytes(a1)) == keccak256('a')); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 1218: (178-224): CHC: Error trying to invoke SMT solver.
// Warning 6328: (178-224): CHC: Assertion violation might happen here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (str1' = str1)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(keccak256(bytes(a1)) == keccak256(bytes(str1)))\n<errorCode> = 2 -> Assertion failed at assert(keccak256(bytes(a1)) == keccak256('a'))\n
// Warning 4661: (178-224): BMC: Assertion violation happens here.
