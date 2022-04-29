type MyInt is int;
contract C {
	function f() public pure returns (MyInt a, int b) {
		(MyInt).wrap;
		a = (MyInt).wrap(5);
		(MyInt).unwrap;
		b = (MyInt).unwrap((MyInt).wrap(10));
	}

	function g() public pure {
		(MyInt x, int y) = f();
		assert(MyInt.unwrap(x) == 5);
		assert(MyInt.unwrap(x) == 6); // should fail
		assert(y == 10);
		assert(y == 11); // should fail
	}

}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6133: (87-99): Statement has no effect.
// Warning 6133: (126-140): Statement has no effect.
// Warning 6328: (274-302): CHC: Assertion violation happens here.
// Warning 6328: (340-355): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true)\n(true || true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(MyInt.unwrap(x) == 5)\n<errorCode> = 2 -> Assertion failed at assert(MyInt.unwrap(x) == 6)\n<errorCode> = 3 -> Assertion failed at assert(y == 10)\n<errorCode> = 4 -> Assertion failed at assert(y == 11)\n
