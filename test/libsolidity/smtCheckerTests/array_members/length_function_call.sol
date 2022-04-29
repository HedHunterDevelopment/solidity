contract C {
	uint[] arr;
	function f() public view {
		assert(arr.length == g().length);
	}
	function g() internal pure returns (uint[] memory) {
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n((arr.length <= 0) || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (arr' = arr)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(arr.length == g().length)\n
