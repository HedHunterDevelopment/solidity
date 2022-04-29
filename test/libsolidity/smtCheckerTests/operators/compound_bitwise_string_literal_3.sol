contract C {
    function f() public pure {
        bytes32 y = "abcdefghabcdefghabcdefghabcdefgh";
        bytes32 z = y;
        y &= "bcdefghabcdefghabcdefghabcdefgha";
        z &= "bcdefghabcdefghabcdefghabcdefgha";
        assert(y == "abcdefghabcdefghabcdefghabcdefgh"); // fails

        y |= "cdefghabcdefghabcdefghabcdefghab";
        z |= "cdefghabcdefghabcdefghabcdefghab";
        assert(y == "abcdefghabcdefghabcdefghabcd"); // fails

        y ^= "abcdefghabcdefghabcdefghabcdefgh";
        assert(y == z ^ "abcdefghabcdefghabcdefghabcdefgh");
    }
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (229-276): CHC: Assertion violation happens here.\nCounterexample:\n\ny = 0x6062606464666060606260646466606060626064646660606062606464666060\nz = 0x6062606464666060606260646466606060626064646660606062606464666060\n\nTransaction trace:\nC.constructor()\nC.f()
// Warning 6328: (394-437): CHC: Assertion violation might happen here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(y == "abcdefghabcdefghabcdefghabcdefgh")\n<errorCode> = 2 -> Assertion failed at assert(y == "abcdefghabcdefghabcdefghabcd")\n<errorCode> = 3 -> Assertion failed at assert(y == z ^ "abcdefghabcdefghabcdefghabcdefgh")\n
// Warning 4661: (394-437): BMC: Assertion violation happens here.
