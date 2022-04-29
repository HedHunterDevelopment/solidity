contract C {
	struct S {
		uint[][] arr;
	}
	S s1;
	S s2;
	constructor() {
		s1.arr.push();
		s2.arr.push();
		s1.arr[0].push();
		s1.arr[0].push();
		s1.arr[0].push();
		s2.arr[0].push();
		s2.arr[0].push();
		s2.arr[0].push();
	}
	function f() public view {
		assert(s1.arr[0].length == s2.arr[0].length);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreOS: macos
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || (((s1.arr[0].length + ((- 1) * s2.arr[0].length)) <= 0) && ((s2.arr[0].length + ((- 1) * s1.arr[0].length)) <= 0)) || true)\n(true || true || true || !(s1.arr.length <= 0))\n(true || true || true || !(s2.arr.length <= 0))\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 2) = (:var 5)) && (s1' = s1) && (s2' = s2)) || true || true || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 2) = (:var 5)) && (s1' = s1) && (s2' = s2)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at s1.arr[0]\n<errorCode> = 2 -> Out of bounds access at s2.arr[0]\n<errorCode> = 3 -> Assertion failed at assert(s1.arr[0].length == s2.arr[0].length)\n<errorCode> = 5 -> Out of bounds access at s1.arr[0]\n<errorCode> = 6 -> Out of bounds access at s1.arr[0]\n<errorCode> = 7 -> Out of bounds access at s1.arr[0]\n<errorCode> = 8 -> Out of bounds access at s2.arr[0]\n<errorCode> = 9 -> Out of bounds access at s2.arr[0]\n<errorCode> = 10 -> Out of bounds access at s2.arr[0]\n
