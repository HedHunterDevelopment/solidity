contract C {
	function f(bytes32 _x) public pure {
		require(_x == "test");
		bytes32 y = _x;
		bytes32 z = _x;
		assert(z == "test");
		assert(y == "testx");
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (137-157): CHC: Assertion violation happens here.\nCounterexample:\n\n_x = 0x7465737400000000000000000000000000000000000000000000000000000000\ny = 0x7465737400000000000000000000000000000000000000000000000000000000\nz = 0x7465737400000000000000000000000000000000000000000000000000000000\n\nTransaction trace:\nC.constructor()\nC.f(0x7465737400000000000000000000000000000000000000000000000000000000)
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(z == "test")\n<errorCode> = 2 -> Assertion failed at assert(y == "testx")\n
