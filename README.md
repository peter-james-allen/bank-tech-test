# Bank tech test

This is my first submission for the Makers Academy Week 10 Tech Test, the goal was to write high quality code.


The specification that was provided is [here](#specification), which I broke down into user stories [here](#user-stories).

The code was written using TDD and meets all of the requirements and acceptance critera with 100% test coverage as outlined [here](#testing). It has been linted wiht rubocop.

The program is written in ruby and tested using rspec, it runs in irb from the terminal as outlined in the user guide [here](#user-guide)

## User Guide

### Start

To launch the program run the following in the terminal
```
irb -r ./lib/bank.rb
```

### Create an Account

You can then create an account by running the following command. This will create an account with no transactions and a balance of zero.
```
account = Account.new
```

### Deposit

To make a deposit run the following command. The amount given as a parameter can be an positive integer or float with two decimal places.
```
account.deposit(100)
```

### Withdrawl

To make a withdrawl run the following command. The amount given as a parameter can be an positive integer or float with two decimal places.
```
account.withdraw(50)
```

### Statements

To view your statement run the following command. This will print all transactions that have been performed on the account to the terminal.
```
account.statement
```
example output:
```
date || credit || debit || balance
07/04/2021 ||  || 50.00 || 50.00
07/04/2021 || 100.00 ||  || 100.00
```

## Testing

The program has been written using TDD, with all tests written in rspec. The test coverage is 100% as measured with simplecov. The To run the tests run the following command in the terminal.
```
rspec -fd
```
Each class has a test file in the 'spec' folder. Where classes have dependancies they have been isolated and mocked with doubles so its easier to debug.

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## User Stories

```
As a customer
So I can store money
I would like to make a deposit
```
```
As a customer
So I can retrieve money
I would like to make a withdrawl
```
```
As a customer
So I can review my account
I would like to view a statement
```
```
As a customer
So I don't have to re-enter data
I would like the program to remember my transactions
```