contract C
{
	enum D { Left, Right }
	function f(uint x) public pure {
		require(x == 0);
		D _a = D(x);
		assert(_a == D.Left);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(_a == D.Left)\n
