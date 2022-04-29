contract C {
	function f() public pure {
		uint x = type(uint256).max - 1;
		assert(x == 2**256 - 2);
		assert(~1 == -2);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Underflow at type(uint256).max - 1\n<errorCode> = 2 -> Assertion failed at assert(x == 2**256 - 2)\n<errorCode> = 3 -> Assertion failed at assert(~1 == -2)\n
