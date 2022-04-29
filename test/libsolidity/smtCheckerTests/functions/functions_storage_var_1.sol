contract C
{
	uint a;
	function f(uint x) public {
		uint y;
		a = (y = x);
	}
	function g() public {
		f(1);
		assert(a > 0);
	}
}

// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a > 0)\n
