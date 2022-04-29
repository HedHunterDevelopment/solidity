abstract contract D {
	function d() external virtual;
}

contract C {
	uint x;
	D d;
	function f() public {
		if (x < 10)
			++x;
	}
	function g() public {
		d.d();
		assert(x < 11);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || !(x >= 11) || true)\nReentrancy property(ies) for :D:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\nReentrancy property(ies) for :C:\n(!(<errorCode> = 1) || true || true)\n(true || ((!(x <= 10) || !(<errorCode> >= 3)) && (!(x <= 10) || !(x' >= 11))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at ++x\n<errorCode> = 3 -> Assertion failed at assert(x < 11)\n
