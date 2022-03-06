pragma solidity ^0.8.7;

contract Car {
    enum VisitType {Inspection, Repair, Overhaul}

    struct Visit {
        uint32 mileage;
        VisitType visitType;
    }

    string private id;

    // Store an array of visits.
    Visit[] visits;
    // Count of visits by type.
    mapping(VisitType => uint) public countVisitTypes;

    constructor(string memory _id) {
        id = _id;
    }

    function registerVisit(uint32 _mileage, VisitType _visitType) public {
        visits.push(Visit(_mileage, _visitType));
        countVisitTypes[_visitType]++;
    }

    function visitsCount() public view returns (uint) {
        return visits.length;
    }

    function hasBeenOverhauled() public view returns (bool) {
        return countVisitTypes[VisitType.Overhaul] > 0;
    }

    function getLastKnownMileage() public view returns (uint32) {
        uint32 lastMileage = 0;
        for (uint i = 0; i < visits.length; i++) {
            if (visits[i].mileage > lastMileage) {
                lastMileage = visits[i].mileage;
            }
        }
        return lastMileage;
    }
}
