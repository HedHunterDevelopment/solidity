contract C {
	function f() public pure {
		uint8 x = 0xff;
		assert(~x == 0x00);
		uint16 y = 0xff00;
		assert(~y == 0xff);
		assert(~y == 0xffff);
		assert(~y == 0x0000);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (126-146): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 255\ny = 65280\n\nTransaction trace:\nC.constructor()\nC.f()
// Warning 6328: (150-170): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 255\ny = 65280\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(~x == 0x00)\n<errorCode> = 2 -> Assertion failed at assert(~y == 0xff)\n<errorCode> = 3 -> Assertion failed at assert(~y == 0xffff)\n<errorCode> = 4 -> Assertion failed at assert(~y == 0x0000)\n
