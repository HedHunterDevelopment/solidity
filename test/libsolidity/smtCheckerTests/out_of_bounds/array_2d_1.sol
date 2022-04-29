contract C {
	uint[][] a;
	function p() public { a.push(); }
	function q(uint i) public {
		require(i < a.length);
		a[i].push();
	}
	function r(uint i, uint j) public view returns (uint) {
		require(i < a.length);
		require(j < a[i].length);
		return a[i][j]; // safe access
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a)) || true || true || true || true || true || true || true || true)\n(true || true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a)) || true || true || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at a[i]\n<errorCode> = 3 -> Out of bounds access at a[i]\n<errorCode> = 4 -> Out of bounds access at a[i]\n<errorCode> = 5 -> Out of bounds access at a[i][j]\n
