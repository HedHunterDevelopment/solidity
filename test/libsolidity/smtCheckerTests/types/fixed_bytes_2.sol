contract C
{
	bytes32 x;
	function f(bytes8 y) public view {
		assert(x == g());
		assert(x != y);
	}
	function g() public view returns (bytes32) {
		return x;
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (83-97): CHC: Assertion violation happens here.\nCounterexample:\nx = 0x0\ny = 0x0\n\nTransaction trace:\nC.constructor()\nState: x = 0x0\nC.f(0x0)\n    C.g() -- internal call
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == g())\n<errorCode> = 2 -> Assertion failed at assert(x != y)\n
