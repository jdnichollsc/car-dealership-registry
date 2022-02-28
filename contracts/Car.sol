pragma solidity ^0.8.7;

contract Car {
    enum VisitType {Inspection, Repair, Overhaul}

    struct Visit {
        uint32 mileage;
        VisitType visitType;
    }

    string private id;

    constructor(string memory _id) {
        id = _id;
        // ...
    }

    function registerVisit(uint32 _mileage, VisitType _visitType) public {
        // ...
    }

    function visitsCount() public view returns (uint) {
        // ...
    }

    function hasBeenOverhauled() public view returns (bool) {
        // ...
    }

    function getLastKnownMileage() public view returns (uint32) {
        // ...
    }
}
