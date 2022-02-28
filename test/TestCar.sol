pragma solidity ^0.8.7;

import "truffle/Assert.sol";
import "../contracts/Car.sol";

contract TestCar {
    function testIfNoVisitsInitially() public {
        Car car = new Car("W8686D");
        Assert.equal(car.visitsCount(), 0, "Should not have any visit registered initially");
    }

    function testIfVisitIsRegistered() public {
        Car car = new Car("W8686D");
        car.registerVisit(1000, Car.VisitType.Inspection);
        Assert.equal(car.visitsCount(), 1, "Should register only one visit");
    }

    function testIfNotOverhauledInitially() public {
        Car car = new Car("W8686D");
        Assert.equal(car.hasBeenOverhauled(), false, "Should not been overhauled initially");
    }

    function testIfCarHasBeenOverhauled() public {
        Car car = new Car("W8686D");
        car.registerVisit(20000, Car.VisitType.Overhaul);
        Assert.equal(car.hasBeenOverhauled(), true, "Car should has be reported as overhauled");
    }

    function testIfCarHasNotBeenOverhauled() public {
        Car car = new Car("W8686D");
        car.registerVisit(20000, Car.VisitType.Repair);
        Assert.equal(car.hasBeenOverhauled(), false, "Car should has be reported as not overhauled");
    }

    function testInitialLastKnowMileage() public {
        Car car = new Car("W8686D");
        Assert.equal(uint256(car.getLastKnownMileage()), 0, "Should return mileage 0 initially");
    }

    function testLastKnownMileage() public {
        Car car = new Car("W8686D");
        car.registerVisit(20000, Car.VisitType.Repair);
        Assert.equal(uint256(car.getLastKnownMileage()), 20000, "Should return last visit mileage");
    }
}
