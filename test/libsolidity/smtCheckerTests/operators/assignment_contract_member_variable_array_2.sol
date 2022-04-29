contract A {
    int[] a;
    function f() public {
		A.a.push();
        A.a[0] = 2;
    }
}

// ====
// SMTEngine: all
// ----
// Info 1180: Reentrancy property(ies) for :A:\n(((<errorCode> = 0) && ((:var 1) = (:var 3)) && (a' = a)) || true || true || true || true)\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Out of bounds access at A.a[0]\n
