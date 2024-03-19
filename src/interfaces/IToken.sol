// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

interface IToken {
    function balanceOf(address _owner) external view returns (uint balance);

    function transfer(address _to, uint _value) external returns (bool);
}
