contract C {
	function f() public pure {
		fixed x;
		assert(x >>> 6 == 0);
	}
}
// ====
// SMTEngine: all
// ----
// UnimplementedFeatureError: Not yet implemented - FixedPointType.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x >>> 6 == 0)\n
