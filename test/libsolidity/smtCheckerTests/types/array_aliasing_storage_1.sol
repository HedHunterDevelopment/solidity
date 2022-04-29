contract C
{
	uint[] array;
	uint[][] array2d;
	uint[][][][] array4d;
	uint8[] tinyArray;
	uint8[][][] tinyArray3d;
	function f(
		uint[] storage a,
		uint[] storage b,
		uint[][] storage cc,
		uint8[][] storage dd,
		uint[][][] storage eee
	) internal {
		a[0] = 2;
		array[0] = 42;
		array2d[0][0] = 42;
		tinyArray[0] = 42;
		cc[0][0] = 42;
		dd[0][0] = 42;
		eee[0][0][0] = 42;
		b[0] = 1;
		// Fails because b == a is possible.
		assert(a[0] == 2);
		// Fails because b == array is possible.
		assert(array[0] == 42);
		// Fails because b == array2d[0] is possible.
		assert(array2d[0][0] == 42);
		// Should not fail since knowledge is erased only for uint[].
		assert(tinyArray[0] == 42);
		// Fails because b == cc[0] is possible.
		assert(cc[0][0] == 42);
		// Should not fail since knowledge is erased only for uint[].
		assert(dd[0][0] == 42);
		// Fails because b == ee[0][0] is possible.
		assert(eee[0][0][0] == 42);
		assert(b[0] == 1);
	}

	function g(uint a, uint b, uint c, uint d, uint e) public {
		require(a < array2d.length);
		require(b < array2d.length);
		require(c < array4d.length);
		require(c < array4d[c].length);
		require(d < tinyArray3d.length);
		require(e < array4d.length);
		// Disabled because of Spacer seg fault.
		//f(array2d[a], array2d[b], array4d[c][c], tinyArray3d[d], array4d[e]);
	}
}
// ====
// SMTEngine: all
// SMTIgnoreCex: yes
// ----
// Warning 2018: (957-1329): Function state mutability can be restricted to view
// Info 1180: Reentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 5) = (:var 11)) && (array' = array) && (array2d' = array2d) && (array4d' = array4d) && (tinyArray' = tinyArray) && (tinyArray3d' = tinyArray3d)) || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at a[0]\n<errorCode> = 2 -> Out of bounds access at array[0]\n<errorCode> = 3 -> Out of bounds access at array2d[0]\n<errorCode> = 4 -> Out of bounds access at array2d[0][0]\n<errorCode> = 5 -> Out of bounds access at tinyArray[0]\n<errorCode> = 6 -> Out of bounds access at cc[0]\n<errorCode> = 7 -> Out of bounds access at cc[0][0]\n<errorCode> = 8 -> Out of bounds access at dd[0]\n<errorCode> = 9 -> Out of bounds access at dd[0][0]\n<errorCode> = 10 -> Out of bounds access at eee[0]\n<errorCode> = 11 -> Out of bounds access at eee[0][0]\n<errorCode> = 12 -> Out of bounds access at eee[0][0][0]\n<errorCode> = 13 -> Out of bounds access at b[0]\n<errorCode> = 14 -> Out of bounds access at a[0]\n<errorCode> = 15 -> Assertion failed at assert(a[0] == 2)\n<errorCode> = 16 -> Out of bounds access at array[0]\n<errorCode> = 17 -> Assertion failed at assert(array[0] == 42)\n<errorCode> = 18 -> Out of bounds access at array2d[0]\n<errorCode> = 19 -> Out of bounds access at array2d[0][0]\n<errorCode> = 20 -> Assertion failed at assert(array2d[0][0] == 42)\n<errorCode> = 21 -> Out of bounds access at tinyArray[0]\n<errorCode> = 22 -> Assertion failed at assert(tinyArray[0] == 42)\n<errorCode> = 23 -> Out of bounds access at cc[0]\n<errorCode> = 24 -> Out of bounds access at cc[0][0]\n<errorCode> = 25 -> Assertion failed at assert(cc[0][0] == 42)\n<errorCode> = 26 -> Out of bounds access at dd[0]\n<errorCode> = 27 -> Out of bounds access at dd[0][0]\n<errorCode> = 28 -> Assertion failed at assert(dd[0][0] == 42)\n<errorCode> = 29 -> Out of bounds access at eee[0]\n<errorCode> = 30 -> Out of bounds access at eee[0][0]\n<errorCode> = 31 -> Out of bounds access at eee[0][0][0]\n<errorCode> = 32 -> Assertion failed at assert(eee[0][0][0] == 42)\n<errorCode> = 33 -> Out of bounds access at b[0]\n<errorCode> = 34 -> Assertion failed at assert(b[0] == 1)\n<errorCode> = 35 -> Out of bounds access at array4d[c]\n
