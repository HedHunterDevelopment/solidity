contract C
{
	uint x;

	modifier m {
		require(x == 0);
		_;
		x = x + 1;
		assert(x <= 2);
	}

	function f() m m public {
		x = x + 1;
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (76-90): CHC: Assertion violation happens here.\nCounterexample:\nx = 3\n\nTransaction trace:\nC.constructor()\nState: x = 0\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at x + 1\n<errorCode> = 2 -> Overflow at x + 1\n<errorCode> = 3 -> Assertion failed at assert(x <= 2)\n<errorCode> = 4 -> Overflow at x + 1\n<errorCode> = 5 -> Assertion failed at assert(x <= 2)\n
