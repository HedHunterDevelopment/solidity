contract C
{
	function f(uint[] memory array, uint x, uint y) public pure {
		require(x < array.length);
		array[x] = 200;
		require(x == y);
		assert(array[y] > 300);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 6328: (144-166): CHC: Assertion violation happens here.
// Info 1180: Reentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at array[x]\n<errorCode> = 2 -> Out of bounds access at array[y]\n<errorCode> = 3 -> Assertion failed at assert(array[y] > 300)\n
