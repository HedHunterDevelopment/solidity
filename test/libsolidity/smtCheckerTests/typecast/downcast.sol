contract C {
	function f1() public pure {
		// signed <- signed
		int8 z = int8(-1);
		assert(z == -1);
		z = int8(int(0) - 1);
		assert(z == -1);
		z = int8(int(0) - 1);
		assert(z == -1);
		z = int8(int(0) - 2);
		assert(z == -2);
		z = int8(int(0) - 1);
		assert(z == -1);

		// unsigned <= unsigned
		uint8 x = uint8(type(uint256).max);
		assert(x == 255);
		x = uint8(type(uint256).max);
		assert(x == 255);

		// signed <- unsigned
		int8 y = int8(uint8(type(uint16).max));
		assert(y == -1);
		y = int8(uint8(uint16(100)));
		assert(y == 100);
		y = int8(uint8(uint16(200)));
		assert(y == -56);

		// unsigned <- signed
		uint8 v = uint8(type(uint16).max);
		assert(v == 255);
		v = uint8(int8(int16(300)));
		assert(v == 44);
		v = uint8(int8(int16(200)));
		assert(v == 200);

		// fixed bytes
		bytes2 b = bytes2(bytes4(0xcafeffff));
		assert(b == 0xcafe);
		b = bytes2(bytes4(bytes8(0xaaaabbbbccccdddd)));
		assert(b == 0xaaaa);
		b = bytes2(bytes8(0xaaaabbbbccccdddd));
		assert(b == 0xaaaa);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(z == -1)\n<errorCode> = 2 -> Underflow at int(0) - 1\n<errorCode> = 3 -> Overflow at int(0) - 1\n<errorCode> = 4 -> Assertion failed at assert(z == -1)\n<errorCode> = 5 -> Underflow at int(0) - 1\n<errorCode> = 6 -> Overflow at int(0) - 1\n<errorCode> = 7 -> Assertion failed at assert(z == -1)\n<errorCode> = 8 -> Underflow at int(0) - 2\n<errorCode> = 9 -> Overflow at int(0) - 2\n<errorCode> = 10 -> Assertion failed at assert(z == -2)\n<errorCode> = 11 -> Underflow at int(0) - 1\n<errorCode> = 12 -> Overflow at int(0) - 1\n<errorCode> = 13 -> Assertion failed at assert(z == -1)\n<errorCode> = 14 -> Assertion failed at assert(x == 255)\n<errorCode> = 15 -> Assertion failed at assert(x == 255)\n<errorCode> = 16 -> Assertion failed at assert(y == -1)\n<errorCode> = 17 -> Assertion failed at assert(y == 100)\n<errorCode> = 18 -> Assertion failed at assert(y == -56)\n<errorCode> = 19 -> Assertion failed at assert(v == 255)\n<errorCode> = 20 -> Assertion failed at assert(v == 44)\n<errorCode> = 21 -> Assertion failed at assert(v == 200)\n<errorCode> = 22 -> Assertion failed at assert(b == 0xcafe)\n<errorCode> = 23 -> Assertion failed at assert(b == 0xaaaa)\n<errorCode> = 24 -> Assertion failed at assert(b == 0xaaaa)\n
