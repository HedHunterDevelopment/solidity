library L
{
	enum D { Left, Right }
}

contract C
{
	enum E { Left, Right }
	function f(E _d) public pure {
		_d = E.Left;
		assert(_d == E.Left);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :L:\n(true || true)\nContract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :L:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(_d == E.Left)\n
