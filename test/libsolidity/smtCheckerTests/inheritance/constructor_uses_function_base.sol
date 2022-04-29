contract A {
	uint x;
	constructor() {
		x = 42;
	}
	function f() public view returns(uint256) {
		return x;
	}
}
contract B is A {
	uint y = f();
}
contract C is B {
	function g() public view {
		assert(y == 42);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :A:\n(true || true)\nContract invariant(s) for :C:\n(true || (!(y <= 41) && !(y >= 43)))\nContract invariant(s) for :B:\n(true || true)\nReentrancy property(ies) for :C:\n(true || true || true || true || ((<errorCode> = 0) && ((:var 2) = (:var 5)) && (y' = y) && (x' = x)) || true)\nReentrancy property(ies) for :A:\n(((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true)\nReentrancy property(ies) for :B:\n(true || ((<errorCode> = 0) && ((:var 2) = (:var 5)) && (y' = y) && (x' = x)))\n<errorCode> = 0 -> no errors\n<errorCode> = 3 -> Assertion failed at assert(y == 42)\n
