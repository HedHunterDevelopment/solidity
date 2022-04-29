contract C {
	function g() internal pure returns (bytes32, bytes16) {
		return ("test", "testz");
	}

	function f(bytes32 _x) public pure {
		require(_x == "test");
		(bytes32 y, bytes16 z) = g();
		assert(_x == y);
		assert(_x == z);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (218-233): CHC: Assertion violation happens here.\nCounterexample:\n\n_x = 0x7465737400000000000000000000000000000000000000000000000000000000\ny = 0x7465737400000000000000000000000000000000000000000000000000000000\nz = 0x746573747a0000000000000000000000\n\nTransaction trace:\nC.constructor()\nC.f(0x7465737400000000000000000000000000000000000000000000000000000000)\n    C.g() -- internal call
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(_x == y)\n<errorCode> = 2 -> Assertion failed at assert(_x == z)\n
