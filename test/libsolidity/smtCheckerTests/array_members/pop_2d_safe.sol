contract C {
	uint[][] a;
	function f() public {
		a.push();
		a[0].push();
		a[0].pop();
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a)) || true || true || true || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at a[0]\n<errorCode> = 2 -> Out of bounds access at a[0]\n<errorCode> = 3 -> Empty array pop at a[0].pop()\n
