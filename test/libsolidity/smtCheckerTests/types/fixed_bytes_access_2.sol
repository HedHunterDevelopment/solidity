contract C {
	function f(bytes calldata x, uint y) external pure {
		require(x.length > 10);
		x[8][0];
		// Disabled because of Spacer nondeterminism.
		//x[8][5%y];
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 5667: (43-49): Unused function parameter. Remove or comment out the variable name to silence this warning.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at x[8]\n<errorCode> = 2 -> Out of bounds access at x[8][0]\n
