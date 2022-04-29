contract LoopFor2 {
	uint[] a;
	function p() public {
		a.push();
	}
	function testUnboundedForLoop(uint n, uint[] memory b, uint[] memory c) public {
		require(n < a.length);
		require(n < b.length);
		require(n < c.length);
		b[0] = 900;
		a = b;
		require(n > 0 && n < 100);
		uint i;
		// Disabled because of Spacer nondeterminism.
		/*
		while (i < n) {
			// Accesses are safe but oob is reported due to potential aliasing after c's assignment.
			b[i] = i + 1;
			c[i] = b[i];
			++i;
		}
		*/
		// Fails due to aliasing, since both b and c are
		// memory references of same type.
		// Removed because current Spacer seg faults in cex generation.
		//assert(b[0] == c[0]);
		assert(a[0] == 900);
		// Removed because current Spacer seg faults in cex generation.
		//assert(b[0] == 900);
	}
}
// ====
// SMTEngine: all
// SMTSolvers: z3
// ----
// Warning 2072: (280-286): Unused local variable.
// Info 1180: Contract invariant(s) for :LoopFor2:\n(true || true || true || true)\nReentrancy property(ies) for :LoopFor2:\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a)) || true || true || true || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a)) || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at b[0]\n<errorCode> = 2 -> Out of bounds access at a[0]\n<errorCode> = 3 -> Assertion failed at assert(a[0] == 900)\n
