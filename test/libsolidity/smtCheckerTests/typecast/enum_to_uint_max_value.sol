contract C
{
	enum D { Left, Right }
	function f(D _a) public pure {
		uint x = uint(_a);
		assert(x < 10);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x < 10)\n
