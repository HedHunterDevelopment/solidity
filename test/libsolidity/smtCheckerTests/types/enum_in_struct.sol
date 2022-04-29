pragma abicoder               v2;

contract C
{
	enum D { Left, Right }
	struct S { uint x; D d; }
	function f(S memory s) public pure {
		s.d = D.Left;
		assert(s.d == D.Left);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(s.d == D.Left)\n
