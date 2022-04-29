contract C
{
	enum D { Left, Right }
	D d;
	function f(D _a) public {
		require(_a == D.Left);
		d = D.Right;
		assert(d != _a);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (d' = d)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(d != _a)\n
