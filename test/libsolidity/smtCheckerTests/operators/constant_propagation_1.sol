contract C {
	uint constant DEPOSIT_CONTRACT_TREE_DEPTH = 32;
	uint constant MAX_DEPOSIT_COUNT = 2**DEPOSIT_CONTRACT_TREE_DEPTH - 1;
	function f() public pure {
		assert(DEPOSIT_CONTRACT_TREE_DEPTH == 32);
		assert(MAX_DEPOSIT_COUNT == 4294967295);
		assert(MAX_DEPOSIT_COUNT == 2); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (251-281): CHC: Assertion violation happens here.\nCounterexample:\nDEPOSIT_CONTRACT_TREE_DEPTH = 32, MAX_DEPOSIT_COUNT = 4294967295\n\nTransaction trace:\nC.constructor()\nState: DEPOSIT_CONTRACT_TREE_DEPTH = 32, MAX_DEPOSIT_COUNT = 4294967295\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 2) = (:var 5)) && (DEPOSIT_CONTRACT_TREE_DEPTH' = DEPOSIT_CONTRACT_TREE_DEPTH) && (MAX_DEPOSIT_COUNT' = MAX_DEPOSIT_COUNT)) || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 2) = (:var 5)) && (DEPOSIT_CONTRACT_TREE_DEPTH' = DEPOSIT_CONTRACT_TREE_DEPTH) && (MAX_DEPOSIT_COUNT' = MAX_DEPOSIT_COUNT)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(DEPOSIT_CONTRACT_TREE_DEPTH == 32)\n<errorCode> = 2 -> Assertion failed at assert(MAX_DEPOSIT_COUNT == 4294967295)\n<errorCode> = 3 -> Assertion failed at assert(MAX_DEPOSIT_COUNT == 2)\n
