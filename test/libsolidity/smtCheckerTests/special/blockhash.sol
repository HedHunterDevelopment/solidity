contract C
{
	function f(uint x) public payable {
		assert(blockhash(x) > 0);
		assert(blockhash(2) > 0);
		uint y = x;
		assert(blockhash(x) == blockhash(y));
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6328: (52-76): CHC: Assertion violation happens here.
// Warning 6328: (80-104): CHC: Assertion violation happens here.
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(blockhash(x) > 0)\n<errorCode> = 2 -> Assertion failed at assert(blockhash(2) > 0)\n<errorCode> = 3 -> Assertion failed at assert(blockhash(x) == blockhash(y))\n
