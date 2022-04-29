contract C {
	uint[] a;
	function f() public {
		a.push();
		a.pop();
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Empty array pop at a.pop()\n
