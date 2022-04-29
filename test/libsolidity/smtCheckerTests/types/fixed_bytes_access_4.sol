contract C {
	function f() public pure {
		bytes32 x = 0x00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff;
		bytes1 z = 0x00;
		bytes1 o = 0xff;
		assert(x[0] == z);
		assert(x[31] == o);
		assert(x[0] == x[22]);
		assert(x[0] == x[23]);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (231-252): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 0xff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff00ff\nz = 0x0\no = 0xff\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at x[0]\n<errorCode> = 2 -> Assertion failed at assert(x[0] == z)\n<errorCode> = 3 -> Out of bounds access at x[31]\n<errorCode> = 4 -> Assertion failed at assert(x[31] == o)\n<errorCode> = 5 -> Out of bounds access at x[0]\n<errorCode> = 6 -> Out of bounds access at x[22]\n<errorCode> = 7 -> Assertion failed at assert(x[0] == x[22])\n<errorCode> = 8 -> Out of bounds access at x[0]\n<errorCode> = 9 -> Out of bounds access at x[23]\n<errorCode> = 10 -> Assertion failed at assert(x[0] == x[23])\n
