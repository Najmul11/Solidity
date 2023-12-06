// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.22;

contract Sum {
    uint public sum = 0;

    function count(uint limit) public {
        for (uint i = 1; i <= limit; i++) {
            sum = i + sum;
        }
    }
}
