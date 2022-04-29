contract C {
	uint[][] public a;
	constructor() {
		a.push();
		a.push();
		a.push();
		a[2].push();
		a[2].push();
		a[2].push();
		a[2].push();
	}
	function f() public view {
		uint y = this.a(2,3);
		assert(y == a[2][3]); // should hold
		assert(y == 1); // should fail
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6328: (242-256): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || !(a[2].length <= 3) || true || true)\n(true || true || !(a.length <= 2))\n(true || true || true || true)\nReentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at a[2]\n<errorCode> = 2 -> Out of bounds access at a[2][3]\n<errorCode> = 3 -> Assertion failed at assert(y == a[2][3])\n<errorCode> = 4 -> Assertion failed at assert(y == 1)\n<errorCode> = 6 -> Out of bounds access at a[2]\n<errorCode> = 7 -> Out of bounds access at a[2]\n<errorCode> = 8 -> Out of bounds access at a[2]\n<errorCode> = 9 -> Out of bounds access at a[2]\n
