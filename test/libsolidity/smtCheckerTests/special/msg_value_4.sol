contract A {
    uint x = msg.value;
    constructor() {
        assert(x == 0); // should hold
    }
}

contract B {
    constructor() payable {
        assert(msg.value == 0); // should fail
    }
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (154-176): CHC: Assertion violation happens here.\nCounterexample:\n\n\nTransaction trace:\nB.constructor(){ msg.value: 39 }
// Info 1180: Contract invariant(s) for :A:\n(true || true)\nContract invariant(s) for :B:\n(true || true)\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :B:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 0)\n<errorCode> = 2 -> Assertion failed at assert(msg.value == 0)\n
