pragma abicoder               v2;

contract C {
	function f(uint[][] memory arr) public pure {
		require(arr.length > 0);
		uint[][] memory arr2 = arr;
		assert(arr2[0].length == arr[0].length);
		assert(arr.length == arr2.length);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at arr2[0]\n<errorCode> = 2 -> Out of bounds access at arr[0]\n<errorCode> = 3 -> Assertion failed at assert(arr2[0].length == arr[0].length)\n<errorCode> = 4 -> Assertion failed at assert(arr.length == arr2.length)\n
