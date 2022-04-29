contract C {
	uint[][] arr;

	constructor() {
		arr.push();
		arr.push();
		arr.push();
		arr.push();
		arr.push();
		arr.push();
		arr.push();
		arr.push();
		arr.push();
	}

	function f() public {
		uint x = arr[2].length;
		uint y = arr[3].length;
		uint z = arr.length;
		uint t = arr[5].length;
		arr[5] = arr[8];
		assert(arr[2].length == x);
		assert(arr[3].length == y);
		assert(arr.length == z);
		assert(arr[5].length == t);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(!(arr.length <= 7) || true)\n(((arr[5].length <= 0) && (arr[8].length <= 0)) || true)\n(true || true || !(arr.length <= 7))\n(true || true || !(arr.length <= 8))\n
