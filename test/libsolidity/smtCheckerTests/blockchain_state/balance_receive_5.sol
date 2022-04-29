contract C {
	uint sum = msg.value;
	function f() public payable {
		sum += msg.value;
	}
	function inv() public view {
		assert(address(this).balance == sum); // should fail
		assert(address(this).balance >= sum); // should hold
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (122-158): CHC: Assertion violation happens here.\nCounterexample:\nsum = 0\n\nTransaction trace:\nC.constructor()\nState: sum = 0\nC.inv()
// Info 1180: Contract invariant(s) for :C:\n(true || ((sum + ((- 1) * (:var 1).balances[address(this)])) <= 0) || true)\n(true || true || ((sum + ((- 1) * (:var 1).balances[address(this)])) <= 0))\nReentrancy property(ies) for :C:\n(true || true || true || true || true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (sum' = sum)) || true || true)\n(true || true || true || true || true || true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (sum' = sum)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Overflow at sum += msg.value\n<errorCode> = 3 -> Assertion failed at assert(address(this).balance == sum)\n<errorCode> = 4 -> Assertion failed at assert(address(this).balance >= sum)\n
