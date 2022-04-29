contract C
{
	enum D { Left, Right }
	D d;
	function f(D _a, D _b) public view {
		require(_a == _b);
		require(_a == d);
		assert(d == _b);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (d' = d)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(d == _b)\n
