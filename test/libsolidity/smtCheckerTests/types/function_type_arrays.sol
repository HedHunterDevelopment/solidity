contract C {
    function(uint) external returns (uint)[] public x;
    function(uint) internal returns (uint)[10] y;
    function f() view public {
        function(uint) returns (uint)[10] memory a;
        function(uint) returns (uint)[10] storage b = y;
        function(uint) external returns (uint)[] memory c;
        c = new function(uint) external returns (uint)[](200);
        assert(c.length == 200);
        a; b;
    }
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 2) = (:var 5)) && (x' = x) && (y' = y)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(c.length == 200)\n
