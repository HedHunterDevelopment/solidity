contract C {
	function f() public pure {
		string memory x = "Hello World";
		assert(bytes(x).length == 11);
	}
	function g() public pure {
		string memory x = unicode"Hello World";
		assert(bytes(x).length == 11);
	}
	function h() public pure {
		bytes memory x = unicode"Hello World";
		string memory y = string(x);
		assert(bytes(y).length == 11);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true || true || true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(bytes(x).length == 11)\n<errorCode> = 3 -> Assertion failed at assert(bytes(x).length == 11)\n<errorCode> = 5 -> Assertion failed at assert(bytes(y).length == 11)\n
