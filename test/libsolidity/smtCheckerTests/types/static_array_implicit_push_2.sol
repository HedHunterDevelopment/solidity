contract C {
	uint[][] a;
	function f(uint[1][] memory x) public {
		require(x.length > 2);
		a.push(x[2]);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at x[2]\n
