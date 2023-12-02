// SPDX-License-Identifier: GPL-3.0


pragma solidity ^0.8.22;

contract Twitter {

    uint16 MAX_TWEET_LENGTH = 280;
    

    struct Tweet {
        uint256 id;
        address author;
        string content;
        uint timestamp;
        uint likes;
    }

    mapping (address =>Tweet[]) public  tweets;
    address public contractOwner;

    constructor(){
        contractOwner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender==contractOwner, "You  are not the owner");
        _;
    }

    function changeTweetLength (uint16 newLength) public {
        MAX_TWEET_LENGTH = newLength;
    }



    function createTweet(string memory _tweet) public {
        require(bytes(_tweet).length <=MAX_TWEET_LENGTH, "Tweet is too long");

        Tweet memory newTweet = Tweet({
            id:tweets[msg.sender].length,
            author: msg.sender,
            content: _tweet,
            timestamp:block.timestamp,
            likes:0
        });
        tweets[msg.sender].push(newTweet);
    }

    function likeTweet (address author, uint256 id) external  {
        require(tweets[author][id].id==id, 'Tweet does not exist');
        tweets[author][id].likes++;
    }
    function unlikeTweet (address author, uint256 id) external  {
        require(tweets[author][id].id==id, 'Tweet does not exist');
        require(tweets[author][id].likes>0, 'Tweet has no like');
        tweets[author][id].likes--;
    }

    function getTweet( uint i) public view returns ( Tweet memory) {
        return  tweets[msg.sender][i];
    }
    function getAllTweets(address owner) public view returns ( Tweet[] memory) {
        return  tweets[owner];
    }
}


// here like unlike tweet