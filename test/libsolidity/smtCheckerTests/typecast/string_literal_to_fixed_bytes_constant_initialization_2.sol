contract MockContract {
	bytes4 public constant SENTINEL_ANY_MOCKS = hex"01";

	constructor() {
		assert(SENTINEL_ANY_MOCKS >= 0);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :MockContract:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (SENTINEL_ANY_MOCKS' = SENTINEL_ANY_MOCKS))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(SENTINEL_ANY_MOCKS >= 0)\n
