pragma experimental SMTChecker;
contract C {
  struct S {
    int a;
    bytes5 b;
  }
  function f() public pure {
    assert(S({a:2, b:""}).b == bytes5(0)); // should hold
    assert(S({a:2, b:""}).a == 0); // should fail
  }
}
// ----
// Warning 5523: (0-31): The SMTChecker pragma has been deprecated and will be removed in the future. Please use the "model checker engine" compiler setting to activate the SMTChecker instead. If the pragma is enabled, all engines will be used.
// Warning 6328: (178-207): CHC: Assertion violation happens here.\nCounterexample:\n\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(S({a:2, b:""}).b == bytes5(0))\n<errorCode> = 2 -> Assertion failed at assert(S({a:2, b:""}).a == 0)\n
