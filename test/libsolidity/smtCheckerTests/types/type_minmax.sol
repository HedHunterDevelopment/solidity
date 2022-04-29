contract C {
	function f(uint a) public pure {
		assert(a <= type(uint).max);
		assert(a >= type(uint).min);
		require(a <= type(uint64).max);
		assert(a <= type(uint64).max);
		assert(a <= type(uint32).max);
	}

	function int_min() public pure {
		int8 int8_min = type(int8).min;
		assert(int8_min == -2**7);

		int16 int16_min = type(int16).min;
		assert(int16_min == -2**15);

		int24 int24_min = type(int24).min;
		assert(int24_min == -2**23);

		int32 int32_min = type(int32).min;
		assert(int32_min == -2**31);

		int64 int64_min = type(int64).min;
		assert(int64_min == -2**63);

		int256 int256_min = type(int256).min;
		assert(int256_min == -2**255);
	}

	function int_max() public pure {
		int8 int8_max = type(int8).max;
		assert(int8_max == 2**7-1);

		int16 int16_max = type(int16).max;
		assert(int16_max == 2**15-1);

		int24 int24_max = type(int24).max;
		assert(int24_max == 2**23-1);

		int32 int32_max = type(int32).max;
		assert(int32_max == 2**31-1);

		int256 int256_max = type(int256).max;
		assert(int256_max == 2**255-1);
	}

	function uint_min() public pure {
		uint8 uint8_min = type(uint8).min;
		assert(uint8_min == 0);

		uint16 uint16_min = type(uint16).min;
		assert(uint16_min == 0);

		uint24 uint24_min = type(uint24).min;
		assert(uint24_min == 0);

		uint32 uint32_min = type(uint32).min;
		assert(uint32_min == 0);

		uint256 uint256_min = type(uint256).min;
		assert(uint256_min == 0);
	}

	function uint_max() public pure {
		uint8 uint8_max = type(uint8).max;
		assert(uint8_max == 2**8-1);

		uint16 uint16_max = type(uint16).max;
		assert(uint16_max == 2**16-1);

		uint24 uint24_max = type(uint24).max;
		assert(uint24_max == 2**24-1);

		uint32 uint32_max = type(uint32).max;
		assert(uint32_max == 2**32-1);

		uint256 uint256_max = type(uint256).max;
		assert(uint256_max == 2**256-1);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (178-207): CHC: Assertion violation happens here.\nCounterexample:\n\na = 4294967296\n\nTransaction trace:\nC.constructor()\nC.f(4294967296)
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true || true || true || true || true || true || true || true)\nReentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true || true || true || true || true || true || true)\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true || true || true || true || true || true)\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true || true || true || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true || true || true || true)\n(true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true || true || true)\n(true || true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true || true)\n(true || true || true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true)\n(true || true || true || true || true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a <= type(uint).max)\n<errorCode> = 2 -> Assertion failed at assert(a >= type(uint).min)\n<errorCode> = 3 -> Assertion failed at assert(a <= type(uint64).max)\n<errorCode> = 4 -> Assertion failed at assert(a <= type(uint32).max)\n<errorCode> = 6 -> Assertion failed at assert(int8_min == -2**7)\n<errorCode> = 7 -> Assertion failed at assert(int16_min == -2**15)\n<errorCode> = 8 -> Assertion failed at assert(int24_min == -2**23)\n<errorCode> = 9 -> Assertion failed at assert(int32_min == -2**31)\n<errorCode> = 10 -> Assertion failed at assert(int64_min == -2**63)\n<errorCode> = 11 -> Assertion failed at assert(int256_min == -2**255)\n<errorCode> = 13 -> Assertion failed at assert(int8_max == 2**7-1)\n<errorCode> = 14 -> Assertion failed at assert(int16_max == 2**15-1)\n<errorCode> = 15 -> Assertion failed at assert(int24_max == 2**23-1)\n<errorCode> = 16 -> Assertion failed at assert(int32_max == 2**31-1)\n<errorCode> = 17 -> Assertion failed at assert(int256_max == 2**255-1)\n<errorCode> = 19 -> Assertion failed at assert(uint8_min == 0)\n<errorCode> = 20 -> Assertion failed at assert(uint16_min == 0)\n<errorCode> = 21 -> Assertion failed at assert(uint24_min == 0)\n<errorCode> = 22 -> Assertion failed at assert(uint32_min == 0)\n<errorCode> = 23 -> Assertion failed at assert(uint256_min == 0)\n<errorCode> = 25 -> Assertion failed at assert(uint8_max == 2**8-1)\n<errorCode> = 26 -> Assertion failed at assert(uint16_max == 2**16-1)\n<errorCode> = 27 -> Assertion failed at assert(uint24_max == 2**24-1)\n<errorCode> = 28 -> Assertion failed at assert(uint32_max == 2**32-1)\n<errorCode> = 29 -> Assertion failed at assert(uint256_max == 2**256-1)\n
