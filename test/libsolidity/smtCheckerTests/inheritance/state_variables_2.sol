contract Base1 {
	uint x;
}

contract Base2 is Base1 {
	uint z;
}

contract C is Base2 {
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
// Info 1180: Contract invariant(s) for :Base1:\n(true || true)\nContract invariant(s) for :Base2:\n(true || true)\nReentrancy property(ies) for :Base1:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :Base2:\n((<errorCode> = 0) && ((:var 2) = (:var 5)) && (z' = z) && (x' = x))\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 2) = (:var 5)) && (z' = z) && (x' = x)) || true || true || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 2) = (:var 5)) && (z' = z) && (x' = x)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at x + y\n<errorCode> = 2 -> Assertion failed at assert(z < 150)\n
