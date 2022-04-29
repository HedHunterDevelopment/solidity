contract C
{
	struct S {
		uint x;
	}

	mapping (uint => S) smap;

	function f(uint y, uint v) public {
		smap[y] = S(v);
		S memory smem = S(v);
		assert(smap[y].x == smem.x);
	}
}
// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :C:\n(true || true || ((<errorCode> = 0) && ((:var 1) = (:var 3)) && (smap' = smap)) || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(smap[y].x == smem.x)\n
