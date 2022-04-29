contract C
{
	function f() internal pure returns (uint, bool, uint) {
		uint x = 3;
		bool b = true;
		uint y = 999;
		return (x, b, y);
	}
	function g() public pure {
		(uint x, bool b, uint y) = f();
		assert(x == 3);
		assert(b);
		assert(y == 999);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 3)\n<errorCode> = 2 -> Assertion failed at assert(b)\n<errorCode> = 3 -> Assertion failed at assert(y == 999)\n
