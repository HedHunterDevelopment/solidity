type T is uint;

contract C {
	function f(bytes memory data) public pure {
		T x = abi.decode(data, (T));
		uint y = abi.decode(data, (uint));
		assert(T.unwrap(x) == y); // should hold
		assert(T.unwrap(x) != y); // should fail
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (188-212): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(T.unwrap(x) == y)\n<errorCode> = 2 -> Assertion failed at assert(T.unwrap(x) != y)\n
