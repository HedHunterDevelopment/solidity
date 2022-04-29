contract C {
	uint[][] a;
	function f() public {
		a.push();
		a.push();
		a[0].push();
		a[1].pop();
	}
}
// ====
// SMTEngine: all
// ----
// Warning 2529: (90-100): CHC: Empty array "pop" happens here.\nCounterexample:\na = [[0], []]\n\nTransaction trace:\nC.constructor()\nState: a = []\nC.f()
// Info 1180: Reentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a)) || true || true || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a)) || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at a[0]\n<errorCode> = 2 -> Out of bounds access at a[1]\n<errorCode> = 3 -> Empty array pop at a[1].pop()\n
