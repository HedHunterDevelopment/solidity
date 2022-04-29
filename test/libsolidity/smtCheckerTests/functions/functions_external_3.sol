abstract contract D
{
	function g(uint x) public virtual;
}

contract C
{
	mapping (uint => uint) storageMap;
	function f(uint y, D d) public {
		mapping (uint => uint) storage map = storageMap;
		require(map[0] == map[1]);
		assert(map[0] == map[1]);
		d.g(y);
		// Storage knowledge is cleared after an external call.
		assert(map[0] == map[1]);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :D:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\nReentrancy property(ies) for :C:\n(!(<errorCode> >= 2) || true)\n((<errorCode> <= 0) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(map[0] == map[1])\n<errorCode> = 2 -> Assertion failed at assert(map[0] == map[1])\n
