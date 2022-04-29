contract C
{
	address thisAddr;
	function f(address a) public {
		require(a == address(this));
		thisAddr = a;
		assert(thisAddr == address(this));
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :C:\n(true || true || true)\nReentrancy property(ies) for :C:\n(true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (thisAddr' = thisAddr)) || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(thisAddr == address(this))\n
