==== Source: s1.sol ====
type MyInt is int;
==== Source: s2.sol ====
import "s1.sol" as M;
contract C {
	function f(int x) public pure returns (M.MyInt) { return M.MyInt.wrap(x); }
	function g(M.MyInt x) public pure returns (int) { return M.MyInt.unwrap(x); }

	function h() public pure {
		assert(M.MyInt.unwrap(f(5)) == 5);
		assert(M.MyInt.unwrap(f(5)) == 6); // should fail
		assert(g(M.MyInt.wrap(1)) == 1);
		assert(g(M.MyInt.wrap(1)) == 0); // should fail
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// SMTIgnoreOS: macos
// ----
// Warning 6328: (s2.sol:259-292): CHC: Assertion violation happens here.
// Warning 6328: (s2.sol:346-377): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for s2.sol:C:\n(true || true || true || true || true)\nReentrancy property(ies) for s2.sol:C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 2 -> Assertion failed at assert(M.MyInt.unwrap(f(5)) == 5)\n<errorCode> = 3 -> Assertion failed at assert(M.MyInt.unwrap(f(5)) == 6)\n<errorCode> = 4 -> Assertion failed at assert(g(M.MyInt.wrap(1)) == 1)\n<errorCode> = 5 -> Assertion failed at assert(g(M.MyInt.wrap(1)) == 0)\n
