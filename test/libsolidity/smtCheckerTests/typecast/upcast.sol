abstract contract D {}

contract C {
	function f1() public pure {
		// unsigned <- signed
		uint16 x = type(uint16).max;
		assert(x == 65535);
		int8 i = int8(-1);
		assert(i == -1);
		x = uint16(uint8(int8(-1)));
		assert(x == 255);
		x = uint16(int16(i));
		assert(x == 65535);
		uint z = uint(uint8(i));
		assert(z == 255);
	}

	function f2() public pure {
		// signed <- unsigned
		int16 y = int16(uint16(uint8(uint(65535))));
		assert(y == 255);
		int z = int(uint(uint8(type(uint).max)));
		assert(z == 255);
		z = int(uint(uint8(255)));
		assert(z == 255);
	}

	function f3() public pure {
		// signed <- signed
		int16 y = int16(uint16(uint8(int8(int(uint(65535))))));
		assert(y == 255);
		int z = int(int8(-1));
		assert(z == -1);
		z = int(int8(int(255)));
		assert(z == -1);
		z = int(int16(5000));
		assert(z == 5000);
	}

	function f4() public pure {
		// unsigned <- unsigned
		uint x = uint(uint8(type(uint).max));
		assert(x == 255);
		x = uint(uint16(type(uint).max));
		assert(x == 65535);
		x = uint(uint16(5000));
		assert(x == 5000);
		uint16 y = uint16(type(uint).max);
		assert(y == 65535);
		y = uint16(uint8(type(uint16).max));
		assert(y == 255);
		address a = address(uint160(uint8(0)));
		assert(a == address(0));
		D d = D(address(uint160(uint8(0))));
		assert(a == address(d));
		bytes2 b1 = 0xcafe;
		bytes4 b2 = bytes4(b1);
		assert(b2 == 0xcafe0000);
		bytes16 b3 = bytes16(b1);
		assert(b3 == 0xcafe0000000000000000000000000000);
		bytes4 b4 = bytes4(uint32(0xcafe));
		assert(b4 == 0x0000cafe);
		bytes4 b5 = bytes4(uint32(0xcafe0000));
		assert(b5 == 0xcafe0000);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true || true || true || true || true || true)\nReentrancy property(ies) for :D:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 65535)\n<errorCode> = 2 -> Assertion failed at assert(i == -1)\n<errorCode> = 3 -> Assertion failed at assert(x == 255)\n<errorCode> = 4 -> Assertion failed at assert(x == 65535)\n<errorCode> = 5 -> Assertion failed at assert(z == 255)\n<errorCode> = 7 -> Assertion failed at assert(y == 255)\n<errorCode> = 8 -> Assertion failed at assert(z == 255)\n<errorCode> = 9 -> Assertion failed at assert(z == 255)\n<errorCode> = 11 -> Assertion failed at assert(y == 255)\n<errorCode> = 12 -> Assertion failed at assert(z == -1)\n<errorCode> = 13 -> Assertion failed at assert(z == -1)\n<errorCode> = 14 -> Assertion failed at assert(z == 5000)\n<errorCode> = 16 -> Assertion failed at assert(x == 255)\n<errorCode> = 17 -> Assertion failed at assert(x == 65535)\n<errorCode> = 18 -> Assertion failed at assert(x == 5000)\n<errorCode> = 19 -> Assertion failed at assert(y == 65535)\n<errorCode> = 20 -> Assertion failed at assert(y == 255)\n<errorCode> = 21 -> Assertion failed at assert(a == address(0))\n<errorCode> = 22 -> Assertion failed at assert(a == address(d))\n<errorCode> = 23 -> Assertion failed at assert(b2 == 0xcafe0000)\n<errorCode> = 24 -> Assertion failed at assert(b3 == 0xcafe0000000000000000000000000000)\n<errorCode> = 25 -> Assertion failed at assert(b4 == 0x0000cafe)\n<errorCode> = 26 -> Assertion failed at assert(b5 == 0xcafe0000)\n
