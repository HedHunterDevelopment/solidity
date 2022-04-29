contract C {
	function o() public pure {
		uint x = type(uint).max;
		unchecked { ++x; }
		assert(x == type(uint).min);
	}

	function u() public pure {
		uint x = type(uint).min;
		unchecked { --x; }
		assert(x == type(uint).max);
	}

	function o_int() public pure {
		int x = type(int).max;
		unchecked { ++x; }
		assert(x == type(int).min);
	}

	function u_int() public pure {
		int x = type(int).min;
		unchecked { --x; }
		assert(x == type(int).max);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true || true || true || true || true)\n(true || true || true || true || true || true || true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == type(uint).min)\n<errorCode> = 4 -> Assertion failed at assert(x == type(uint).max)\n<errorCode> = 7 -> Assertion failed at assert(x == type(int).min)\n<errorCode> = 10 -> Assertion failed at assert(x == type(int).max)\n
