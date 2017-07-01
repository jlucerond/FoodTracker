//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Joe Lucero on 6/29/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    func testMealInitializationSucceeds() {
        let zeroRatingMeal = Meal(name: "Zero", rating: 0, photo: nil)
        XCTAssertNotNil(zeroRatingMeal)
        let highestRatedMeal = Meal(name: "Five", rating: 5, photo: nil)
        XCTAssertNotNil(highestRatedMeal)
    }
    
    func testMealIntializationFails() {
        let noNamedMeal = Meal(name: "", rating: 3, photo: nil)
        XCTAssertNil(noNamedMeal)
        let negativeRatingMeal = Meal(name: "-2", rating: -2, photo: nil)
        XCTAssertNil(negativeRatingMeal)
        let tooHighRatedMeal = Meal(name: "Seven", rating: 7, photo: nil)
        XCTAssertNil(tooHighRatedMeal)
    }
    
}
