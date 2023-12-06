// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.22;


contract Sum {
    function count(uint limit) public pure returns(uint){

        uint sum=0;

        for (uint i=1; i<=limit; i++){
            sum = i + sum;
        }
        return  sum;
    }
    
}