contract C
{
	uint x;

	modifier m {
		// Condition is always true for the second invocation.
		require(x > 0);
		require(x < 10000);
		_;
		assert(x > 1);
	}

	function f() m m public {
		x = x + 1;
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at x + 1\n<errorCode> = 2 -> Assertion failed at assert(x > 1)\n<errorCode> = 3 -> Assertion failed at assert(x > 1)\n
