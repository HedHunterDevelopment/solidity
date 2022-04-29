contract C {
	uint[] a;
	function p() public { a.push(); }
	function r(uint i) public view returns (uint) {
		require(i < a.length);
		return a[i]; // safe access
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at a[i]\n
