contract A {
	uint x;
	function h() public view {
		assert(x == 0);
	}
}

contract B is A {
	function g() public view {
		assert(x == 0);
	}
}

contract C is B {
	function f() public view {
		assert(x == 0);
	}
}
// ====
// SMTEngine: all
// SMTSolvers: z3
// ----
// Info 1180: Contract invariant(s) for :A:\n((x <= 0) || true)\n(true || true || true)\nContract invariant(s) for :C:\n((x <= 0) || true || true || true)\n(true || true || true || true || true || true || true)\nContract invariant(s) for :B:\n((x <= 0) || true || true)\n(true || true || true || true || true)\nReentrancy property(ies) for :C:\n(true || true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true || true || true || true || true || true)\n(true || true || true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true || true || true || true || true)\n(true || true || true || true || true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true || true || true || true)\nReentrancy property(ies) for :A:\n(((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true || true)\nReentrancy property(ies) for :B:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (x' = x)) || true || true || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(x == 0)\n<errorCode> = 3 -> Assertion failed at assert(x == 0)\n<errorCode> = 5 -> Assertion failed at assert(x == 0)\n<errorCode> = 7 -> Assertion failed at assert(x == 0)\n<errorCode> = 9 -> Assertion failed at assert(x == 0)\n<errorCode> = 11 -> Assertion failed at assert(x == 0)\n
