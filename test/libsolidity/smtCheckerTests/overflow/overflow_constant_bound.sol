contract DepositContract {
    uint constant MAX_DEPOSIT_COUNT = 2**32 - 1;

    uint256 deposit_count;
    uint256 deposit_count_2;

    function deposit() external {
        require(deposit_count < MAX_DEPOSIT_COUNT);
        deposit_count += 1;
        deposit_count_2 += 10; // should fail
    }
}
// ====
// SMTEngine: all
// ----
// Warning 4984: (256-277): CHC: Overflow (resulting value larger than 2**256 - 1) might happen here.
// Info 1180: Reentrancy property(ies) for :DepositContract:\n(true || true || true || ((<errorCode> = 0) && ((:var 3) = (:var 7)) && (MAX_DEPOSIT_COUNT' = MAX_DEPOSIT_COUNT) && (deposit_count' = deposit_count) && (deposit_count_2' = deposit_count_2)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at deposit_count += 1\n<errorCode> = 2 -> Overflow at deposit_count_2 += 10\n
// Warning 2661: (256-277): BMC: Overflow (resulting value larger than 2**256 - 1) happens here.
