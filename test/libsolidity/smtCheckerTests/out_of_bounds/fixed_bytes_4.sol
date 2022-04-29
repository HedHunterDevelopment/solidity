contract C {
	function r(bytes32 x, uint y) public pure {
		x[0]; // safe access
		// Disabled because of Spacer nondeterminism.
		//x[y]; // oob access
	}
}
// ====
// SMTEngine: all
// ----
// Warning 5667: (36-42): Unused function parameter. Remove or comment out the variable name to silence this warning.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at x[0]\n
