contract C {
	uint256 public z;

	function f() public {
		z = 42;
		uint i = 32;
		assembly {
			function f() {
				sstore(z.slot, 7)
			}
			f()
		}
		assert(z == 42); // should fail
		assert(z == 7); // should hold, but the analysis cannot know this yet
		assert(i == 32); // should hold, not changed by the assembly
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 7737: (83-149): Inline assembly may cause SMTChecker to produce spurious warnings (false positives).
// Warning 6328: (152-167): CHC: Assertion violation happens here.
// Warning 6328: (186-200): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (z' = z)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(z == 42)\n<errorCode> = 2 -> Assertion failed at assert(z == 7)\n<errorCode> = 3 -> Assertion failed at assert(i == 32)\n
