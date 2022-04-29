contract C
{
	function f() public pure {
		if (true) {
		} else {
			address a = g();
			assert(a == address(0));
		}
	}
	function g() public pure returns (address) {
		address x;
		x = address(0);
		return x;
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a == address(0))\n
