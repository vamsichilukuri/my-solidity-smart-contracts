pragma solidity ^0.7.0;

contract Hotel{
    
    address payable public owner;
    enum Statuses  { Occupied, Vacant }
    Statuses CurrentStatus;
    event Occupy(address _occupent , uint _value);

    constructor() public {
        owner = msg.sender;
        CurrentStatus = Statuses.Vacant;
    }
    
    modifier costs(uint _amount){
        require(msg.value >= _amount , 'Not enough ether');
        _;
    }
    
    modifier onlyVacant(){
        require(CurrentStatus == Statuses.Vacant , 'Hotel room is occupied');
        _;
    }
    
    receive() external payable onlyVacant costs(2 ether) {
        owner.transfer(msg.value);
        CurrentStatus = Statuses.Occupied;
        emit Occupy(msg.sender, msg.value);
    }
}
