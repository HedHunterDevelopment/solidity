contract Base {
	uint x;
	uint private t;
}

contract C is Base {

	uint private z;
	function f(uint y) public {
		require(x < 10);
		require(y < 100);
		z = x + y;
		assert(z < 150);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :Base:\n(true || true)\nReentrancy property(ies) for :Base:\n((<errorCode> = 0) && ((:var 2) = (:var 5)) && (x' = x) && (t' = t))\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 3) = (:var 7)) && (z' = z) && (x' = x) && (t' = t)) || true || true || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 3) = (:var 7)) && (z' = z) && (x' = x) && (t' = t)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at x + y\n<errorCode> = 2 -> Assertion failed at assert(z < 150)\n
