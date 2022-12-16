# push_based_Decentralized_Oracle_Solidity
Lab lesson 1

##Introduction to Oracles in Blockchain
A Smart Contract provides the security, transparency, efficiency and trust to initiate an agreement inside a blockchain. 
Since it is executed inside a blockchain, it cannot access any external data such as weather data, or currency rates.
Blockchain Oracles are designed to mitigate this issue.

Current oracles protocols are hybrid systems that rely on smart contracts and off chain APIs to bridge web 2.0 data as well as other blockchains.
The most prominent oracle is Chainlink, which provides pricing data, connection to other blockchains, access to most APIs, and a variety of other data feeds.

A client smart contract is not allowed to interact with the outside world.
This must be done by going through a mechanism where the need for the external data is broadcast via transaction events.
Then an external party that listens for such events get notified for the request, grabs the requested data and finally sends it into the chain by calling the smart contract via a transaction.
![](https://assets-global.website-files.com/5dfc18aeef0cf97edeb5ccd2/5ed15da9150ab8ef1c0ca55c_Screen%20Shot%202020-05-29%20at%203.07.44%20PM.png)



## Tasks
For this lab we will be making a push based oracle providing weather services.
The oracle must provide a function that retrieves weather data for a given city.

###Requirements:
+ A weather service deploys the oracle and regularly submits new weather data
++ tip: use 2 arrays, one for city names, one for data in a list
+ Only the newest data is kept, no need  to store  historic data in the smart contact
+ There is a way to retrieve weather data about a certain city by name
+ Weather data includes:
++ temperature (in C°, no digits after the comma)
++ Wind power (in km/h, no digits after the comma, max 500 km/h)
++ Chance of rain ( a percentage, no digits after the comma)
++ Wind direction (one of N, NE, E, SE, SW, W, NW)
+ There is a way to retrieve how old the weather data is for a specific city


## How to do? 

To feed data to the smart contract, we have to use an oracle service off-chain.
The oracle will have to perform some actions on behalve of the smart contract.

### The oracle service has to "listen/watch/pull" for an Event
There are only two on-chain items that the service will have the ability to watch:
+ state variables  (but to difficult to implement)
+ events --> YES!

smart contract event -->   *emit newEvent(block.timestamp)*