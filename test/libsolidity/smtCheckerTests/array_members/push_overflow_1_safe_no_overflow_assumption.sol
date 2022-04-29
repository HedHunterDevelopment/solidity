contract C {
	uint256[] x;
	constructor() { x.push(42); }
	function f() public {
		x.push(23);
		assert(x[0] == 42);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || (!((x[x.length] := 23)[0] >= 43) && !((x[x.length] := 23)[0] <= 41)))\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at x[0]\n<errorCode> = 2 -> Assertion failed at assert(x[0] == 42)\n
