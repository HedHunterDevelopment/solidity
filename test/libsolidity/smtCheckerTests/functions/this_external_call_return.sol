contract C
{
	uint x;
	function f(uint y) public returns (uint) {
		x = y;
		return x;
	}
	function g(uint y) public {
		require(y < 1000);
		uint z = this.f(y);
		assert(z < 1000);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(z < 1000)\n
