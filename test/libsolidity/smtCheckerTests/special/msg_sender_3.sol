contract C {
	address owner;

	constructor() {
		owner = msg.sender;
		assert(owner >= address(0)); // should hold
	}
}

contract D {
	address owner;

	constructor() {
		unchecked {
			owner = msg.sender;
			assert(owner >= address(0)); // should hold
		}
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true)\nContract invariant(s) for :D:\n(true || true)\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (owner' = owner))\nReentrancy property(ies) for :D:\n((<errorCode> = 0) && ((:var 1) = (:var 3)) && (owner' = owner))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(owner >= address(0))\n<errorCode> = 2 -> Assertion failed at assert(owner >= address(0))\n
