contract C
{
	modifier m(address a) {
		if (true) {
			a = g();
			_;
			assert(a == address(0));
		}
	}

	function f(address a) m(a) public pure {
	}
	function g() public pure returns (address) {
		address a;
		a = address(0);
		return a;
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a == address(0))\n
