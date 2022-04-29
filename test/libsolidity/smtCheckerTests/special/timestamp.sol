contract C {
    function f() public view returns (uint) {
        uint b = block.timestamp;
        uint a = b + 0; // Overflow not possible!
        return a;
    }
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at b + 0\n
