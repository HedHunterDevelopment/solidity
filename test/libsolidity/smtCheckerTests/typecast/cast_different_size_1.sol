contract C
{
	function f() public pure {
		bytes2 a = 0x1234;
		uint32 b = uint16(a); // b will be 0x00001234
		assert(b == 0x1234);
		uint32 c = uint32(bytes4(a)); // c will be 0x12340000
		assert(c == 0x12340000);
		uint8 d = uint8(uint16(a)); // d will be 0x34
		assert(d == 0x34);
		uint8 e = uint8(bytes1(a)); // e will be 0x12
		assert(e == 0x12);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(b == 0x1234)\n<errorCode> = 2 -> Assertion failed at assert(c == 0x12340000)\n<errorCode> = 3 -> Assertion failed at assert(d == 0x34)\n<errorCode> = 4 -> Assertion failed at assert(e == 0x12)\n
