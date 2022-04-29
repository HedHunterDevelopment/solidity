contract C {

	function f(bytes1 b) public pure {
		bytes1 c = hex"7f";
		require(b > c);
		assert(uint8(b) > 127); // should hold
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(uint8(b) > 127)\n
