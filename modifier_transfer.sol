// SPDX-License-Identifier: GPL-3.0


pragma solidity ^0.8.22;


contract PausableToken {
    address public owner = msg.sender;
    bool public paused;
    mapping (address=>uint) public balances;


    constructor(){
        // owner = msg.sender;
        paused = false;
        balances[owner] = 1000;
    }

    modifier onlyOwner (){
        require(msg.sender==owner,"You are not owner");
        _;
    }
    modifier notPaused (){
        require(paused==false,"The contract is paused");
        _;
    }

  function pause() public  onlyOwner {
    paused=true;
  }
  function unPause() public  onlyOwner {
    paused=false;
  }

  function transfer(address to, uint amount) public  notPaused {
    require(balances[msg.sender]>=amount , "Not enough balance");
    balances[msg.sender] -=amount;
    balances[to] +=amount;
  }
}