contract C {
	uint[] a;
	constructor() {
		a.push();
		a.pop();
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true)\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Empty array pop at a.pop()\n
