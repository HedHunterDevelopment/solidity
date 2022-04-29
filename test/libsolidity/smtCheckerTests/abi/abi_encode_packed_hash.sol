contract C {
	function abiencodePackedHash(uint a, uint b) public pure {
		require(a == b);
		bytes memory b1 = abi.encodePacked(a, a, a, a);
		bytes memory b2 = abi.encodePacked(b, a, b, a);
		assert(keccak256(b1) == keccak256(b2));

		bytes memory b3 = abi.encode(a, a, a, a);
		assert(keccak256(b1) == keccak256(b3)); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 1218: (281-319): CHC: Error trying to invoke SMT solver.
// Warning 6328: (281-319): CHC: Assertion violation might happen here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(keccak256(b1) == keccak256(b2))\n<errorCode> = 2 -> Assertion failed at assert(keccak256(b1) == keccak256(b3))\n
// Warning 4661: (281-319): BMC: Assertion violation happens here.
