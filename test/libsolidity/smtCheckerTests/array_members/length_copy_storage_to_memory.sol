contract C {
	uint[] arr;
	function f() public view {
		uint[] memory marr = arr;
		assert(marr.length == arr.length);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 1) = (:var 3)) && (arr' = arr)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(marr.length == arr.length)\n
