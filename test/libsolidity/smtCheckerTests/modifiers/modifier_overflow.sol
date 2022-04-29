contract C
{
	uint x;

	modifier m {
		require(x > 0);
		_;
	}

	function f() m public {
		assert(x > 0);
		x = x + 1;
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n((x <= 0) || true)\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x > 0)\n<errorCode> = 2 -> Overflow at x + 1\n
