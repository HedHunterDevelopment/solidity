contract C {
	struct S {
		uint x;
	}

	S s;

	function f() public {
		s.x = 42;
		S memory sm = s;
		assert(sm.x == 42); // should hold
		uint256 i = 7;
		assembly {
			mstore(sm, i)
		}
		assert(sm.x == 42); // should fail
		assert(sm.x == 7); // should hold, but the analysis cannot know this yet
		assert(s.x == 42); // should hold, storage not changed by the assembly
		assert(i == 7); // should hold, not changed by the assembly
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 7737: (156-187): Inline assembly may cause SMTChecker to produce spurious warnings (false positives).
// Warning 6328: (190-208): CHC: Assertion violation happens here.
// Warning 6328: (227-244): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 1) = (:var 3)) && (s' = s)) || true || true || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (s' = s)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(sm.x == 42)\n<errorCode> = 2 -> Assertion failed at assert(sm.x == 42)\n<errorCode> = 3 -> Assertion failed at assert(sm.x == 7)\n<errorCode> = 4 -> Assertion failed at assert(s.x == 42)\n<errorCode> = 5 -> Assertion failed at assert(i == 7)\n
