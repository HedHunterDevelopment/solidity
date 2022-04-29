contract C {
	uint[] arr;
	function f() public view {
		uint x = arr.length;
		uint y = x;
		assert(arr.length == y);
		assert(arr.length != y);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (120-143): CHC: Assertion violation happens here.\nCounterexample:\narr = []\nx = 0\ny = 0\n\nTransaction trace:\nC.constructor()\nState: arr = []\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (arr' = arr)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(arr.length == y)\n<errorCode> = 2 -> Assertion failed at assert(arr.length != y)\n
