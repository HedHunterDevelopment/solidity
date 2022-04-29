contract C {
	uint256[] public a;

	function f() public {
		require(a.length == 0);
		uint256[] storage x = a;
		assert(x.length == 0); // should hold
		uint256 i = 7;
		assembly {
			sstore(x.slot, 7)
		}
		assert(x.length == 0); // should fail
		assert(x.length == 7); // should hold, but the analysis cannot know this yet
		assert(i == 7); // should hold, not changed by the assembly
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 7737: (170-205): Inline assembly may cause SMTChecker to produce spurious warnings (false positives).
// Warning 6328: (208-229): CHC: Assertion violation happens here.
// Warning 6328: (248-269): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a)) || true || true || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a)) || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x.length == 0)\n<errorCode> = 2 -> Assertion failed at assert(x.length == 0)\n<errorCode> = 3 -> Assertion failed at assert(x.length == 7)\n<errorCode> = 4 -> Assertion failed at assert(i == 7)\n
