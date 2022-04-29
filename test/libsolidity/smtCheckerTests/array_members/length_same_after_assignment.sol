contract C {
	uint[] arr;
	constructor() {
		arr.push();
		arr.push();
		arr.push();
		arr.push();
	}
	function f() public view {
		uint[] memory arr2 = arr;
		arr2[2] = 3;
		assert(arr.length == arr2.length);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || !(arr.length <= 2) || true)\n(true || true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (arr' = arr)) || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (arr' = arr)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at arr2[2]\n<errorCode> = 2 -> Assertion failed at assert(arr.length == arr2.length)\n
