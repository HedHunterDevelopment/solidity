contract C
{
	uint[] array;
	function p() public { array.push(); }
	function f(uint x, uint y) public {
		require(x < array.length);
		array[x] = 200;
		require(x == y);
		assert(array[y] > 300);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (172-194): CHC: Assertion violation happens here.\nCounterexample:\narray = [200]\nx = 0\ny = 0\n\nTransaction trace:\nC.constructor()\nState: array = []\nC.p()\nState: array = [0]\nC.f(0, 0)
// Info 1180: Reentrancy property(ies) for :C:\n(((<errorCode> = 0) && ((:var 1) = (:var 3)) && (array' = array)) || true || true || true || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at array[x]\n<errorCode> = 2 -> Out of bounds access at array[y]\n<errorCode> = 3 -> Assertion failed at assert(array[y] > 300)\n
