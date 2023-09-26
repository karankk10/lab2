// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;


contract FirstCon {
    
    uint public value;
    function setValue(uint _value) public {
        value = _value;
    }
}


contract SecondCon {
   
    address public firstContract;

    
    constructor(address _firstContract) {
        firstContract = _firstContract;
    }

    function updateValue(uint _value) public {
        (bool success,) = firstContract.delegatecall(abi.encodeWithSignature("setValue(uint256)", _value));
        require(success, "Call failure");
    }
}