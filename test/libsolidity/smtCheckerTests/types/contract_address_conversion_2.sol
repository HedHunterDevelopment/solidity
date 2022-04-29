contract C
{
	function f(C c, C d) public pure {
		assert(address(c) == address(c));
		address a = address(c);
		require(c == d);
		assert(a == address(d));
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(address(c) == address(c))\n<errorCode> = 2 -> Assertion failed at assert(a == address(d))\n
