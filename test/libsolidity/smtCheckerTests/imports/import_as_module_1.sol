==== Source: A ====
import "s1.sol" as M;
contract D is M.C {
	function f(uint _y) public {
		g(_y);
		assert(x == _y); // should hold
		assert(x > 100); // should fail
	}
}
==== Source: s1.sol ====
contract C {
	uint x;
	function g(uint _x) public {
		x = _x;
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (A:117-132): CHC: Assertion violation happens here.\nCounterexample:\nx = 0\n_y = 0\n\nTransaction trace:\nD.constructor()\nState: x = 0\nD.f(0)\n    C.g(0) -- internal call
// Info 1180: Contract invariant(s) for A:D:\n(true || true || true || true)\nContract invariant(s) for s1.sol:C:\n(true || true)\nReentrancy property(ies) for A:D:\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true)\nReentrancy property(ies) for s1.sol:C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == _y)\n<errorCode> = 2 -> Assertion failed at assert(x > 100)\n
