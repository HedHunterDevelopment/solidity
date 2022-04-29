contract C {
	mapping (uint => mapping (uint => mapping (uint => uint[]))) public m;

	constructor() {
		m[0][1][2].push();
		m[0][1][2].push();
		m[0][1][2].push();
		m[0][1][2].push();
		m[0][1][2][3] = 42;
	}

	function f() public view {
		uint y = this.m(0,1,2,3);
		assert(y == m[0][1][2][3]); // should hold
		// Disabled because Spacer seg faults
		//assert(y == 1); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || !(m[0][1][2].length <= 3) || true)\n(true || true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 1) = (:var 3)) && (m' = m)) || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (m' = m)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at m[0][1][2][3]\n<errorCode> = 2 -> Assertion failed at assert(y == m[0][1][2][3])\n<errorCode> = 4 -> Out of bounds access at m[0][1][2][3]\n
