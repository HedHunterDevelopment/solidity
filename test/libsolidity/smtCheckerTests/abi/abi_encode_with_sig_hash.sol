contract C {
	function abiEncodeHash(string memory sig, uint a, uint b) public pure {
		require(a == b);
		bytes memory b1 = abi.encodeWithSignature(sig, a, a, a, a);
		bytes memory b2 = abi.encodeWithSignature(sig, b, a, b, a);
		assert(keccak256(b1) == keccak256(b2));

		bytes memory b3 = abi.encodeWithSelector("f()", a, a, a, a);
		assert(keccak256(b1) == keccak256(b3)); // should fail
		assert(keccak256(b1) != keccak256(b3)); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 1218: (394-432): CHC: Error trying to invoke SMT solver.
// Warning 6328: (337-375): CHC: Assertion violation happens here.
// Warning 6328: (394-432): CHC: Assertion violation might happen here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(keccak256(b1) == keccak256(b2))\n<errorCode> = 2 -> Assertion failed at assert(keccak256(b1) == keccak256(b3))\n<errorCode> = 3 -> Assertion failed at assert(keccak256(b1) != keccak256(b3))\n
// Warning 4661: (394-432): BMC: Assertion violation happens here.
