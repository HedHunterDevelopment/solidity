contract C
{
	enum D { Left, Right }
	function f(D a) public pure {
		assert(a == D.Left || a == D.Right);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a == D.Left || a == D.Right)\n
