contract C
{
	function f() internal pure returns (uint, bool, uint) {
		return (2, false, 3);
	}
	function g() public pure {
		uint x;
		uint y;
		bool b;
		(,b,) = f();
		assert(x == 2);
		assert(y == 4);
		assert(!b);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (172-186): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 0\ny = 0\nb = false\n\nTransaction trace:\nC.constructor()\nC.g()\n    C.f() -- internal call
// Warning 6328: (190-204): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 0\ny = 0\nb = false\n\nTransaction trace:\nC.constructor()\nC.g()\n    C.f() -- internal call
// Info 1180: Reentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 2)\n<errorCode> = 2 -> Assertion failed at assert(y == 4)\n<errorCode> = 3 -> Assertion failed at assert(!b)\n
