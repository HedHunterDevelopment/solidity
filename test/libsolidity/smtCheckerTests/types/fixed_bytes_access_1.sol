contract c {
	bytes10[6] data2;
	function test() public view returns (bytes10 r2) {
		r2 = data2[4][5];
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :c:\n(!(data2.length <= 5) || true)\n(true || true || true)\nReentrancy property(ies) for :c:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (data2' = data2)) || true || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (data2' = data2)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at data2[4]\n<errorCode> = 2 -> Out of bounds access at data2[4][5]\n
