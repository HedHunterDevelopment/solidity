contract C {
    address lastCaller;

    constructor() {
        lastCaller = msg.sender;
    }

    modifier log {
        lastCaller = msg.sender;
        _;
    }

    function test() log public {
        assert(lastCaller == msg.sender);
        this.g();
        assert(lastCaller == address(this));
        assert(lastCaller == msg.sender);
        assert(lastCaller == address(0));
    }

    function g() log public {
    }
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6328: (314-346): CHC: Assertion violation happens here.
// Warning 6328: (356-388): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (lastCaller' = lastCaller)) || true || true || true || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (lastCaller' = lastCaller)) || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(lastCaller == msg.sender)\n<errorCode> = 2 -> Assertion failed at assert(lastCaller == address(this))\n<errorCode> = 3 -> Assertion failed at assert(lastCaller == msg.sender)\n<errorCode> = 4 -> Assertion failed at assert(lastCaller == address(0))\n
