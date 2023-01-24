pragma solidity ^0.8.10;

/*
Lab lesson 1 (design patterns) Making a push-based oracle 

For this lab we will be making a push-based oracle providing weather services. 
The oracle must provide a function that retrieves weather data for a given city. 

Requirements 
• A weather service deploys the oracle and regularly submits new weather data 
• The weather service submits new weather data in a list 
• Tip: use 2 arrays, one for city names, one for weather data 
• Only the newest data is kept, no need to store historic data in the smart contract 
• There is a way to retrieve weather data about a certain city by name 
• Weather data includes: 
• Temperature (in °C, no digits after the comma) 
• Wind power (in km/h, no digits after the comma, max 500 km/h) 
• Chance of rain (a percentage, no digits after the comma) 
• Wind direction (one of N, NE, E, SE, S, SW, W, NW) 
• There is a way to retrieve how old the weather data is for a specific city 

Things to think about: 
• Optimise your storage! Don't store more than you need 

*/

contract Oracle {

    enum WindDirection{
         N, NE, E, SE, S, SW, W, NW
    }

    struct WeatherData {
        int temperature;
        uint wind_power;
        uint rain_percentage;
        WindDirection wind_direction;

    }

    mapping(string => WeatherData) weatherData;
    mapping(string => uint) latestUpdate;

    modifier onlyOwner(){
        //TO DO
        _;
    }

    function setWeatherData(string [] memory cities, WeatherData[] memory _weatherData) public onlyOwner{
        for(uint i= 0; i < cities.length; i++){
            weatherData[cities[i]] = _weatherData[i];
            latestUpdate[cities[i]] = block.timestamp;
        }

    }

    function getWeatherData(string memory city) public view returns(WeatherData memory){
        return weatherData[city];
    }

    function hasWeatherDataFor(string memory city) public view returns(bool){
        return latestUpdate[city] > 0;
    }




}