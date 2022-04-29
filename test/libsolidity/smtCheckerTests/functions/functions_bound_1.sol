library L
{
	function add(uint x, uint y) internal pure returns (uint) {
		require(x < 1000);
		require(y < 1000);
		return x + y;
	}
}

contract C
{
	using L for uint;
	function f(uint x) public pure {
		uint y = x.add(999);
		assert(y < 10000);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :L:\n(true || true)\nReentrancy property(ies) for :L:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at x + y\n<errorCode> = 2 -> Overflow at x + y\n<errorCode> = 3 -> Assertion failed at assert(y < 10000)\n
