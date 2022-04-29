contract C
{
	function f() public pure {
		if (true) {
			address a = g();
			assert(a == address(0));
		}
		if (true) {
			address a = h();
			assert(a == address(0));
		}

	}
	function g() public pure returns (address) {
		address a;
		a = address(0);
		return a;
	}
	function h() public pure returns (address) {
		address a;
		return a;
	}

}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a == address(0))\n<errorCode> = 2 -> Assertion failed at assert(a == address(0))\n
