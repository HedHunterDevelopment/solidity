contract A {
	uint x;
	function f() internal view {
		assert(x == 0);
	}
}

contract B is A {
	uint a;
	uint b;
}

contract C is B {
	uint y;
	uint z;
	uint w;
	function g() public {
		x = 1;
		f();
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (54-68): CHC: Assertion violation happens here.\nCounterexample:\ny = 0, z = 0, w = 0, a = 0, b = 0, x = 1\n\nTransaction trace:\nC.constructor()\nState: y = 0, z = 0, w = 0, a = 0, b = 0, x = 0\nC.g()\n    A.f() -- internal call
// Info 1180: Contract invariant(s) for :A:\n(true || true)\nContract invariant(s) for :B:\n(true || true)\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :B:\n((<errorCode> = 0) && ((:var 3) = (:var 7)) && (a' = a) && (b' = b) && (x' = x))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 0)\n<errorCode> = 2 -> Assertion failed at assert(x == 0)\n<errorCode> = 3 -> Assertion failed at assert(x == 0)\n
