pragma solidity >= 0.7.0 < 0.9.0;

/*

push based oracle

*/

/*
    uint [] cityNames= [];
    uint [] weatherData= [];  // weather Data  temperature C° no digits after the comma
                                // windpower ( in km/h, no digits after the comma, max 500 km/h)
                                // chance of rain  (a percentage, no digits  after the comma)
                                // wind direction ( one of N, NE, E,SE, S, SW, W, NW)

 */

 /*
This contract is linked with a relayer in https://defender.openzeppelin.com/
which is responsible to provide the data weather

most of the contract logic is perform is Openzeppelin Defender
which is not exactly what was asked in the Labs but can be a good illustration 
of how to move the business logic off-chain and use less gas in Solidity

in the Relayer that we have created in Defender, 
we add as information:
- the ABI of the contract (that we have in remix)
- the contract address
- the function getWeatherData that calls the weather API

to deploy the contract we can only use the relayer address 0x6e9542da1a2a61363a555344fe13a1f463ffbfd8

 */
import "@openzeppelin/contracts/access/Ownable.sol";

contract WeatherDataProvider is Ownable {
    
    // the oracle sources the data temperature which is th data we are going to watch
    int temperature;
    // we create relayer in Openzeppelin Defender, which is responsible for updating the data
    address private relayer;
    uint decimals = 4;

    constructor(address _relayer) {
        setRelayer(_relayer);
    }

    function updateTemperature(int temp) onlyRelayer public {
        temperature = temp;
    }

    function getTemperature() public view returns(int) {
        return temperature;
    }

    function getRoundedTemperature() public view returns(int) {
        return temperature / int(10**decimals);
    }

    function getRelayer() public view returns(address) {
        return relayer;
    }

    function setRelayer(address _relayer) onlyOwner public {
        relayer = _relayer;
    }

    function setDecimals(uint _decimals) onlyRelayer public {
        decimals = _decimals;
    }

    function getDecimals() public view returns(uint) {
        return decimals;
    }

    // we make sure that only the address that we provide for the relayer in openzeppelin
    // can provide/change the information (also see modifier below)
    function _checkRelayer() internal view virtual {
        require(relayer == msg.sender, "Caller is not the relayer");
    }

    modifier onlyRelayer {
        _checkRelayer();
        _;
    }




}


