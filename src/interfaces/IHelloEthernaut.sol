// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

interface IHelloEthernaut {
    function authenticate(string memory password) external;

    function password() external view returns (string memory password);
}
