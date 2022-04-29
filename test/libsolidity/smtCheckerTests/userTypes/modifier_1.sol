type T1 is uint;
type T2 is uint;

contract C {
	modifier m(T1 x, T2 y) {
		require(T1.unwrap(x) == T2.unwrap(y));
		_;
	}

	function f(uint x, uint y) m(T1.wrap(x), T2.wrap(y)) public pure {
		assert(x == y);
		assert(x != y); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (212-226): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 0\ny = 0\n\nTransaction trace:\nC.constructor()\nC.f(0, 0)
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == y)\n<errorCode> = 2 -> Assertion failed at assert(x != y)\n
