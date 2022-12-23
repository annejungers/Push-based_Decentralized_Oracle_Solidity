pragma solidity >= 0.7.0 < 0.9.0;

/*

push based oracle

*/


contract Oracle {

    uint [] cityNames= [];
    uint [] weatherData= [];  // weather Data  temperature C° no digits after the comma
                                // windpower ( in km/h, no digits after the comma, max 500 km/h)
                                // chance of rain  (a percentage, no digits  after the comma)
                                // wind direction ( one of N, NE, E,SE, S, SW, W, NW)
                                
}