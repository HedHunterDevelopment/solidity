contract A {
	uint public x = msg.value;
	constructor() {
		assert(x == 0); // should fail, if A is constructed as part of C, it can have any msg.value
	}
}

contract C is A {
	uint public v = msg.value; // 1
	constructor() A() payable {
		assert(v == 0); // should fail, C can be constructed with any msg.value
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (60-74): CHC: Assertion violation happens here.\nCounterexample:\nv = 0, x = 1\n\nTransaction trace:\nC.constructor(){ msg.value: 1 }
// Warning 6328: (240-254): CHC: Assertion violation happens here.\nCounterexample:\nv = 1, x = 1\n\nTransaction trace:\nC.constructor(){ msg.value: 1 }
// Info 1180: Contract invariant(s) for :A:\n(true || true)\nContract invariant(s) for :C:\n(true || true)\nReentrancy property(ies) for :A:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x))\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 2) = (:var 5)) && (v' = v) && (x' = x))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 0)\n<errorCode> = 2 -> Assertion failed at assert(v == 0)\n<errorCode> = 3 -> Assertion failed at assert(x == 0)\n
