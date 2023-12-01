// SPDX-License-Identifier: GPL-3.0


pragma solidity ^0.8.22;

contract Twitter {
    mapping (address =>string[]) public  tweets;

    function createTweet(string memory _tweet) public {
        tweets[msg.sender].push(_tweet);
    }

    function getTweet(address owner, uint i) public view returns ( string memory) {
        return  tweets[owner][i];
    }
    function getAllTweets(address owner) public view returns ( string[] memory) {
        return  tweets[owner];
    }
}


//tweeter tweeter