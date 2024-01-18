// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {Script} from "lib-src/Script.sol";
import {console} from "lib-src/console.sol";

import {IHelloEthernaut} from "src/interfaces/IHelloEthernaut.sol";

// forge script script/0_HelloEthernaut.s.sol -vvv
contract HelloEthernautSolution is Script {

    IHelloEthernaut public target = IHelloEthernaut(0x4992D997Ce384458568e82c2Ae31d47406177273);

    function run() external {
        string memory password = target.password();
        console.log("Password: ", password);

        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        target.authenticate(password);
        vm.stopBroadcast();
    }
}
