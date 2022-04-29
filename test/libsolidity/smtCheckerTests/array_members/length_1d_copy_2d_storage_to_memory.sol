pragma abicoder               v2;

contract C {
	uint[][] arr;
	constructor() {
		arr.push();
		arr.push();
		arr.push();
		arr.push();
	}
	function f() public view {
		uint[][] memory arr2 = arr;
		assert(arr2[0].length == arr[0].length);
		assert(arr2.length == arr.length);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(!(arr.length <= 1) || true)\n(true || true || true || true)\nReentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (arr' = arr)) || true || true)\n(true || true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (arr' = arr)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at arr2[0]\n<errorCode> = 2 -> Out of bounds access at arr[0]\n<errorCode> = 3 -> Assertion failed at assert(arr2[0].length == arr[0].length)\n<errorCode> = 4 -> Assertion failed at assert(arr2.length == arr.length)\n
