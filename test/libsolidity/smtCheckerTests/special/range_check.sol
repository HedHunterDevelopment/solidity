contract C {
	constructor() payable {
		assert(tx.origin >= address(0));
		assert(tx.origin <= address(2**160 - 1));
		assert(tx.gasprice >= 0);
		assert(tx.gasprice <= 2**256 - 1);
		assert(msg.sender >= address(0));
		assert(msg.sender <= address(2**160 - 1));
		assert(msg.value >= 0);
		assert(msg.value <= 2**256 - 1);

		assert(block.coinbase >= address(0));
		assert(block.coinbase <= address(2**160 - 1));
		assert(block.timestamp >= 0);
		assert(block.timestamp <= 2**256 - 1);
		assert(block.chainid >= 0);
		assert(block.chainid <= 2**256 - 1);
		assert(block.difficulty >= 0);
		assert(block.difficulty <= 2**256 - 1);
		assert(block.gaslimit >= 0);
		assert(block.gaslimit <= 2**256 - 1);
		assert(block.number >= 0);
		assert(block.number <= 2**256 - 1);
	}
}

contract D {
	constructor() payable {
		unchecked {
			assert(tx.origin >= address(0));
			assert(tx.origin <= address(2**160 - 1));
			assert(tx.gasprice >= 0);
			assert(tx.gasprice <= 2**256 - 1);
			assert(msg.sender >= address(0));
			assert(msg.sender <= address(2**160 - 1));
			assert(msg.value >= 0);
			assert(msg.value <= 2**256 - 1);

			assert(block.coinbase >= address(0));
			assert(block.coinbase <= address(2**160 - 1));
			assert(block.timestamp >= 0);
			assert(block.timestamp <= 2**256 - 1);
			assert(block.chainid >= 0);
			assert(block.chainid <= 2**256 - 1);
			assert(block.difficulty >= 0);
			assert(block.difficulty <= 2**256 - 1);
			assert(block.gaslimit >= 0);
			assert(block.gaslimit <= 2**256 - 1);
			assert(block.number >= 0);
			assert(block.number <= 2**256 - 1);
		}
	}
}

// ====
// SMTEngine: all
// ----
// Info 1180: Contract invariant(s) for :D:\n(true || true)\nReentrancy property(ies) for :C:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\nReentrancy property(ies) for :D:\n((<errorCode> = 0) && ((:var 0) = (:var 1)))\n<errorCode> = 0 -> no errors\n<errorCode> = 1 -> Assertion failed at assert(tx.origin >= address(0))\n<errorCode> = 2 -> Assertion failed at assert(tx.origin <= address(2**160 - 1))\n<errorCode> = 3 -> Assertion failed at assert(tx.gasprice >= 0)\n<errorCode> = 4 -> Assertion failed at assert(tx.gasprice <= 2**256 - 1)\n<errorCode> = 5 -> Assertion failed at assert(msg.sender >= address(0))\n<errorCode> = 6 -> Assertion failed at assert(msg.sender <= address(2**160 - 1))\n<errorCode> = 7 -> Assertion failed at assert(msg.value >= 0)\n<errorCode> = 8 -> Assertion failed at assert(msg.value <= 2**256 - 1)\n<errorCode> = 9 -> Assertion failed at assert(block.coinbase >= address(0))\n<errorCode> = 10 -> Assertion failed at assert(block.coinbase <= address(2**160 - 1))\n<errorCode> = 11 -> Assertion failed at assert(block.timestamp >= 0)\n<errorCode> = 12 -> Assertion failed at assert(block.timestamp <= 2**256 - 1)\n<errorCode> = 13 -> Assertion failed at assert(block.chainid >= 0)\n<errorCode> = 14 -> Assertion failed at assert(block.chainid <= 2**256 - 1)\n<errorCode> = 15 -> Assertion failed at assert(block.difficulty >= 0)\n<errorCode> = 16 -> Assertion failed at assert(block.difficulty <= 2**256 - 1)\n<errorCode> = 17 -> Assertion failed at assert(block.gaslimit >= 0)\n<errorCode> = 18 -> Assertion failed at assert(block.gaslimit <= 2**256 - 1)\n<errorCode> = 19 -> Assertion failed at assert(block.number >= 0)\n<errorCode> = 20 -> Assertion failed at assert(block.number <= 2**256 - 1)\n<errorCode> = 21 -> Assertion failed at assert(tx.origin >= address(0))\n<errorCode> = 22 -> Assertion failed at assert(tx.origin <= address(2**160 - 1))\n<errorCode> = 23 -> Assertion failed at assert(tx.gasprice >= 0)\n<errorCode> = 24 -> Assertion failed at assert(tx.gasprice <= 2**256 - 1)\n<errorCode> = 25 -> Assertion failed at assert(msg.sender >= address(0))\n<errorCode> = 26 -> Assertion failed at assert(msg.sender <= address(2**160 - 1))\n<errorCode> = 27 -> Assertion failed at assert(msg.value >= 0)\n<errorCode> = 28 -> Assertion failed at assert(msg.value <= 2**256 - 1)\n<errorCode> = 29 -> Assertion failed at assert(block.coinbase >= address(0))\n<errorCode> = 30 -> Assertion failed at assert(block.coinbase <= address(2**160 - 1))\n<errorCode> = 31 -> Assertion failed at assert(block.timestamp >= 0)\n<errorCode> = 32 -> Assertion failed at assert(block.timestamp <= 2**256 - 1)\n<errorCode> = 33 -> Assertion failed at assert(block.chainid >= 0)\n<errorCode> = 34 -> Assertion failed at assert(block.chainid <= 2**256 - 1)\n<errorCode> = 35 -> Assertion failed at assert(block.difficulty >= 0)\n<errorCode> = 36 -> Assertion failed at assert(block.difficulty <= 2**256 - 1)\n<errorCode> = 37 -> Assertion failed at assert(block.gaslimit >= 0)\n<errorCode> = 38 -> Assertion failed at assert(block.gaslimit <= 2**256 - 1)\n<errorCode> = 39 -> Assertion failed at assert(block.number >= 0)\n<errorCode> = 40 -> Assertion failed at assert(block.number <= 2**256 - 1)\n
