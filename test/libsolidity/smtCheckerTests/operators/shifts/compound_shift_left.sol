contract C {
    function f(uint256 a, uint256 b) internal pure returns (uint256) {
        a <<= b;
        return a;
    }
    function t() public pure {
        assert(f(0x4266, 0x0) == 0x4266);
        assert(f(0x4266, 0x8) == 0x426600);
        assert(f(0x4266, 0xf0) == 0x4266000000000000000000000000000000000000000000000000000000000000);
        assert(f(0x4266, 0x4266) == 0);
    }
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(f(0x4266, 0x0) == 0x4266)\n<errorCode> = 2 -> Assertion failed at assert(f(0x4266, 0x8) == 0x426600)\n<errorCode> = 3 -> Assertion failed at assert(f(0x4266, 0xf0) == 0x4266000000000000000000000000000000000000000000000000000000000000)\n<errorCode> = 4 -> Assertion failed at assert(f(0x4266, 0x4266) == 0)\n
