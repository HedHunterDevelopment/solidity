library l1 {

	uint private constant TON = 1000;
	function f1() public pure {
		assert(TON == 1000);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :l1:\n(true || true || true)\nReentrancy property(ies) for :l1:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (TON' = TON)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(TON == 1000)\n
