// SPDX-License-Identifier: GPL-3.0


pragma solidity ^0.8.22;

contract Twitter {

struct Tweet {
    address author;
    string content;
    uint timestamp;
    uint likes;
}

    mapping (address =>Tweet[]) public  tweets;



    function createTweet(string memory _tweet) public {
        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _tweet,
            timestamp:block.timestamp,
            likes:0
        });
        tweets[msg.sender].push(newTweet);
    }

    function getTweet(address owner, uint i) public view returns ( Tweet memory) {
        return  tweets[owner][i];
    }
    function getAllTweets(address owner) public view returns ( Tweet[] memory) {
        return  tweets[owner];
    }
}