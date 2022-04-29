contract C
{
	function f(address payable a) public {
		require(1000 == address(this).balance);
		require(100 == a.balance);
		a.transfer(600);
		// a == this is not possible because address(this).balance == 1000
		// and a.balance == 100,
		// so this should hold in CHC, ignoring the transfer revert.
		assert(a.balance == 700);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 0) = (:var 1))) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(a.balance == 700)\n
