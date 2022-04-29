contract C {
	function f() public pure {
		uint8 x = 1;
		uint16 y = 0;
		assert(x | y != 0);
		x = 0xff;
		y = 0xff00;
		assert(x | y == 0xff);
		assert(x | y == 0xffff);
		assert(x | y == 0x0000);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (122-143): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 255\ny = 65280\n\nTransaction trace:\nC.constructor()\nC.f()
// Warning 6328: (174-197): CHC: Assertion violation happens here.\nCounterexample:\n\nx = 255\ny = 65280\n\nTransaction trace:\nC.constructor()\nC.f()
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x | y != 0)\n<errorCode> = 2 -> Assertion failed at assert(x | y == 0xff)\n<errorCode> = 3 -> Assertion failed at assert(x | y == 0xffff)\n<errorCode> = 4 -> Assertion failed at assert(x | y == 0x0000)\n
