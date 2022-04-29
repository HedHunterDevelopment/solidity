function f(uint) pure returns (uint) {
	return 2;
}
function f(string memory) pure returns (uint) {
	return 3;
}

contract C {
	function g() public pure {
		(uint x, uint y) = (f(2), f("abc"));
		assert(x == 2); // should hold
		assert(y == 4); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (229-243): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 2\ny = 3\n\nTransaction trace:\nC.constructor()\nC.g()\n    f(2) -- internal call\n    f([0x61, 0x62, 0x63]) -- internal call
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 2)\n<errorCode> = 2 -> Assertion failed at assert(y == 4)\n
