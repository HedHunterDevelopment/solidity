contract C {
	mapping (uint => uint[]) public m;

	constructor() {
		m[0].push();
		m[0].push();
		m[0][1] = 42;
	}

	function f() public view {
		uint y = this.m(0,1);
		assert(y == m[0][1]); // should hold
		assert(y == 1); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (210-224): CHC: Assertion violation happens here.\nCounterexample:\n\ny = 42\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || !(m[0].length <= 1) || true)\n(true || true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (m' = m)) || true || true || true || true)\n(true || true || true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (m' = m)))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at m[0][1]\n<errorCode> = 2 -> Assertion failed at assert(y == m[0][1])\n<errorCode> = 3 -> Assertion failed at assert(y == 1)\n<errorCode> = 5 -> Out of bounds access at m[0][1]\n
