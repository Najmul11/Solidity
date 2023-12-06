// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.22;

contract ExpenseTracker {
    struct Expense {
        address user;
        string description;
        uint amount;
    }

    Expense[] public expenses;

    constructor() {
        expenses.push(Expense(msg.sender, "Onion", 50));
        expenses.push(Expense(msg.sender, "Garlic", 50));
        expenses.push(Expense(msg.sender, "Ginger", 50));
    }

    function addExpense(string memory _description, uint _amount) public {
        expenses.push(Expense(msg.sender, _description, _amount));
    }

    function getTotalExpense(address _user) public view returns (uint) {
        uint totalExpense = 0;
        for (uint i = 0; i < expenses.length; i++) {
            if (expenses[i].user == _user) {
                totalExpense += expenses[i].amount;
            }
        }
        return totalExpense;
    }
}
