contract A {
	uint public x = msg.value;
	constructor() {
		assert(x == 0); // can fail when A is constructed as part of C
	}
}

contract B {
	constructor() payable {
		assert(msg.value >= 0); // should hold
	}
}
contract C is A, B {
	constructor() A() B() payable {
		assert(msg.value >= 0); // should hold
	}
}

// ====
// SMTEngine: all
// ----
// Warning 6328: (60-74): CHC: Assertion violation happens here.\nCounterexample:\nx = 1\n\nTransaction trace:\nC.constructor(){ msg.value: 1 }
// Info 1180: Contract invariant(s) for :A:\n(true || true)\nContract invariant(s) for :B:\n(true || true)\nContract invariant(s) for :C:\n(true || true)\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :B:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 0)\n<errorCode> = 2 -> Assertion failed at assert(msg.value >= 0)\n<errorCode> = 3 -> Assertion failed at assert(msg.value >= 0)\n<errorCode> = 4 -> Assertion failed at assert(msg.value >= 0)\n<errorCode> = 5 -> Assertion failed at assert(x == 0)\n
