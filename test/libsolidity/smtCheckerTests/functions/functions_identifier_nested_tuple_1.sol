contract C {
	uint x;
	function f() public {
		x = 0;
		((inc))();
		assert(x == 1); // should hold
	}

	function inc() internal returns (uint) {
		require(x < 100);
		return ++x;
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 1)\n<errorCode> = 3 -> Overflow at ++x\n
