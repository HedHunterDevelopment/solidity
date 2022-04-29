contract C
{
	function f(uint x) public pure returns (uint, uint) {
		return (x, x);
	}

	function g() public pure {
		(uint a, uint b) = f(0);
		(uint c, uint d) = f(0);
		assert(a == c && b == d);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a == c && b == d)\n
