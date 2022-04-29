contract C {
	mapping (uint => mapping (uint => uint[])) public m;

	constructor() {
		m[0][1].push();
		m[0][1].push();
		m[0][1].push();
		m[0][1][2] = 42;
	}

	function f() public view {
		uint y = this.m(0,1,2);
		assert(y == m[0][1][2]); // should hold
		assert(y == 1); // should fail
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6328: (260-274): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || !(m[0][1].length <= 2) || true)\n(true || true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 1) = (:var 3)) && (m' = m)) || true || true || true || true || true)\n(true || true || true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (m' = m)))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at m[0][1][2]\n<errorCode> = 2 -> Assertion failed at assert(y == m[0][1][2])\n<errorCode> = 3 -> Assertion failed at assert(y == 1)\n<errorCode> = 5 -> Out of bounds access at m[0][1][2]\n
