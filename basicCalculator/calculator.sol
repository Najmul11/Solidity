// SPDX-License-Identifier: GPL-3.0


pragma solidity ^0.8.22;

contract Calculator {
    uint256 public  result = 0;

    function add(uint256 num) public {
       result +=num;
    }
    function substact(uint256 num) public {
       result -=num;
    }
    function multiply(uint256 num) public {
       result =num*result;
    }
    function devide(uint256 num) public {
       result =result / num;
    }

   function get() public view returns  (uint256) {
    return  result;
   }
}