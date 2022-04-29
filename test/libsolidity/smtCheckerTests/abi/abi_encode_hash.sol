contract C {
	function abiEncodeHash(uint a, uint b) public pure {
		require(a == b);
		bytes memory b1 = abi.encode(a, a, a, a);
		bytes memory b2 = abi.encode(b, a, b, a);
		assert(keccak256(b1) == keccak256(b2));
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(keccak256(b1) == keccak256(b2))\n
