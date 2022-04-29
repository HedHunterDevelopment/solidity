interface I1 {
}

interface I2 {
	function f() external;
}

interface I3 {
	function f() external;
	function g(uint, address) external;
}

contract C {
	function f() public pure {
		assert(type(I1).interfaceId == 0);
		assert(type(I2).interfaceId != 0);
		assert(type(I2).interfaceId == 0x26121ff0);
		assert(type(I2).interfaceId != 0);
		assert(type(I3).interfaceId == 0x822b51c6);
	}
	function g() public pure {
		assert(type(I1).interfaceId == type(I2).interfaceId);
	}
	function h() public pure {
		assert(type(I2).interfaceId == type(I3).interfaceId);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (416-468): CHC: Assertion violation happens here.\nCounterexample:\n\n\nTransaction trace:\nC.constructor()\nC.g()
// Warning 6328: (503-555): CHC: Assertion violation happens here.\nCounterexample:\n\n\nTransaction trace:\nC.constructor()\nC.h()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true || true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true || true)\nReentrancy property(ies) for :I1:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\nReentrancy property(ies) for :I2:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\nReentrancy property(ies) for :I3:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(type(I1).interfaceId == 0)\n<errorCode> = 2 -> Assertion failed at assert(type(I2).interfaceId != 0)\n<errorCode> = 3 -> Assertion failed at assert(type(I2).interfaceId == 0x26121ff0)\n<errorCode> = 4 -> Assertion failed at assert(type(I2).interfaceId != 0)\n<errorCode> = 5 -> Assertion failed at assert(type(I3).interfaceId == 0x822b51c6)\n<errorCode> = 7 -> Assertion failed at assert(type(I1).interfaceId == type(I2).interfaceId)\n<errorCode> = 9 -> Assertion failed at assert(type(I2).interfaceId == type(I3).interfaceId)\n
