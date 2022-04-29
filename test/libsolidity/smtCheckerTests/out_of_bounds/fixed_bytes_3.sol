contract C {
	function r(bytes32 x, uint y) public pure {
		require(y <= 31);
		x[0]; // safe access
		x[y]; // safe access
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at x[0]\n<errorCode> = 2 -> Out of bounds access at x[y]\n
