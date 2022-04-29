contract C {
	function f(bytes memory data) public pure {
		bytes32 k = keccak256(data);
		fi(data, k);
	}
	function fi(bytes memory data, bytes32 k) internal pure {
		bytes32 h = keccak256(data);
		assert(h == k);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(h == k)\n
