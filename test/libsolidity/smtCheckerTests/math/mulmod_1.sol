contract C {
	function f() public pure {
		assert(mulmod(2**256 - 1, 2, 14) == 2);
		uint y = 0;
		uint x = mulmod(2**256 - 1, 10, y);
		assert(x == 1);
	}
	function g(uint x, uint y, uint k) public pure returns (uint) {
		return mulmod(x, y, k);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 4281: (108-133): CHC: Division by zero happens here.\nCounterexample:\n\ny = 0\nx = 0\n\nTransaction trace:\nC.constructor()\nC.f()
// Warning 6328: (137-151): CHC: Assertion violation happens here.\nCounterexample:\n\ny = 0\nx = 0\n\nTransaction trace:\nC.constructor()\nC.f()
// Warning 4281: (230-245): CHC: Division by zero happens here.\nCounterexample:\n\nx = 0\ny = 0\nk = 0\n = 0\n\nTransaction trace:\nC.constructor()\nC.g(0, 0, 0)
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true || true || true || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Division by zero at mulmod(2**256 - 1, 2, 14)\n<errorCode> = 3 -> Assertion failed at assert(mulmod(2**256 - 1, 2, 14) == 2)\n<errorCode> = 4 -> Division by zero at mulmod(2**256 - 1, 10, y)\n<errorCode> = 6 -> Assertion failed at assert(x == 1)\n<errorCode> = 8 -> Division by zero at mulmod(x, y, k)\n
