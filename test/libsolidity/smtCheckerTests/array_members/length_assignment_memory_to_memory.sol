contract C {
	function f(uint[] memory arr) public pure {
		uint[] memory arr2 = arr;
		assert(arr2.length == arr.length);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(arr2.length == arr.length)\n
