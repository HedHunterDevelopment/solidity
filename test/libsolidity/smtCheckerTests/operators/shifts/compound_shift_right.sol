contract C {
    function f(uint256 a, uint256 b) internal pure returns (uint256) {
        a >>= b;
        return a;
    }
    function t() public pure {
        assert(f(0x4266, 0) == 0x4266);
        assert(f(0x4266, 0x8) == 0x42);
        assert(f(0x4266, 0x11) == 0);
        assert(f(57896044618658097711785492504343953926634992332820282019728792003956564819968, 5) == 1809251394333065553493296640760748560207343510400633813116524750123642650624);
    }
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(f(0x4266, 0) == 0x4266)\n<errorCode> = 2 -> Assertion failed at assert(f(0x4266, 0x8) == 0x42)\n<errorCode> = 3 -> Assertion failed at assert(f(0x4266, 0x11) == 0)\n<errorCode> = 4 -> Assertion failed at assert(f(57896044618658097711785492504343953926634992332820282019728792003956564819968, 5) == 1809251394333065553493296640760748560207343510400633813116524750123642650624)\n
