contract C
{
	function h(uint x) public pure returns (uint) {
		return x;
	}
	function g() public pure {
		uint x;
		x = (h)(42);
		assert(x > 0);
	}
}

// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x > 0)\n
