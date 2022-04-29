contract C
{
	uint x;
	function f(uint y) public {
		x = y;
	}
	function g(uint y) public {
		require(y < 1000);
		this.f(y);
		assert(x < 1000);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true)\nReentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x < 1000)\n
