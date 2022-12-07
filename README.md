# push_based_Decentralized_Oracle_Solidity
Lab lesson 1

For this lab we will be making a push based oracle providing weather services.
The oracle must provide a function that retrieves weather data for a given city

Requirements:
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


