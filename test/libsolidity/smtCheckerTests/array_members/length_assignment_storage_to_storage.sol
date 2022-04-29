contract C {
	uint[] arr;
	uint[] arr2;
	function f() public {
		arr2 = arr;
		assert(arr2.length == arr.length);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 2) = (:var 5)) && (arr' = arr) && (arr2' = arr2)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(arr2.length == arr.length)\n
