//
//  CarTests.swift
//  WasAutoTests
//
//  Created by Wagner Sales on 25/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import WasAuto

class CarTests: BaseTest {

	func testWithCarsJSON() {
		let cars = Car.arrayFromJson(self.carJSON)
		let expected = 10
		XCTAssertEqual(cars.count, expected, "The cars count should be equal to \(expected).")
	}

	func testWithCarsJSONFail() {
		let cars = Car.arrayFromJson(self.invalidJSON)
		let expected = 0
		XCTAssertEqual(cars.count, expected, "The cars count should be equal to \(expected).")
	}

}
