contract C {
	struct S {
		int[][] d;
	}
	S[] data;
	constructor() {
		data.push();
		data.push();
		data[1].d.push();
		data[1].d.push();
		data[1].d.push();
		data[1].d.push();
	}
	function f() public {
		++data[1].d[3].push();
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || !(data[1].d.length <= 3) || true || true)\n(true || true || !(data.length <= 1) || true)\n(true || true || true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 1) = (:var 3)) && (data' = data)) || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at data[1]\n<errorCode> = 2 -> Out of bounds access at data[1].d[3]\n<errorCode> = 3 -> Underflow at ++data[1].d[3].push()\n<errorCode> = 4 -> Overflow at ++data[1].d[3].push()\n<errorCode> = 6 -> Out of bounds access at data[1]\n<errorCode> = 7 -> Out of bounds access at data[1]\n<errorCode> = 8 -> Out of bounds access at data[1]\n<errorCode> = 9 -> Out of bounds access at data[1]\n
