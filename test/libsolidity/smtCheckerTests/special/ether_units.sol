contract D {
	function f() public pure {
		assert(1000000000000000000 wei == 1 ether);
		assert(100000000000000000 wei == 1 ether);
		assert(1000000000 wei == 1 gwei);
		assert(100000000 wei == 1 gwei);
		assert(1000000000 gwei == 1 ether);
		assert(100000000 gwei == 1 ether);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (89-130): CHC: Assertion violation happens here.\nCounterexample:\n\n\nTransaction trace:\nD.constructor()\nD.f()
// Warning 6328: (170-201): CHC: Assertion violation happens here.\nCounterexample:\n\n\nTransaction trace:\nD.constructor()\nD.f()
// Warning 6328: (243-276): CHC: Assertion violation happens here.\nCounterexample:\n\n\nTransaction trace:\nD.constructor()\nD.f()
// Info 1180: Contract invariant(s) for :D:\n(true || true || true)\nReentrancy property(ies) for :D:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(1000000000000000000 wei == 1 ether)\n<errorCode> = 2 -> Assertion failed at assert(100000000000000000 wei == 1 ether)\n<errorCode> = 3 -> Assertion failed at assert(1000000000 wei == 1 gwei)\n<errorCode> = 4 -> Assertion failed at assert(100000000 wei == 1 gwei)\n<errorCode> = 5 -> Assertion failed at assert(1000000000 gwei == 1 ether)\n<errorCode> = 6 -> Assertion failed at assert(100000000 gwei == 1 ether)\n
