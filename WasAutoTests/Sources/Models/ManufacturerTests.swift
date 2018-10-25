//
//  ManufacturerTests.swift
//  WasAutoTests
//
//  Created by Wagner Sales on 25/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import WasAuto

class ManufacturerTests: BaseTest {

	func testWithManufacturersJSON() {
		let manufacturers = Manufacturer.arrayFromJson(self.manufacturerJSON)
		let expected = 10
		XCTAssertEqual(manufacturers.count, expected, "The manufacturers count should be equal to \(expected).")
	}

	func testWithManufacturersJSONFail() {
		let manufacturers = Manufacturer.arrayFromJson(self.invalidJSON)
		let expected = 0
		XCTAssertEqual(manufacturers.count, expected, "The manufacturers count should be equal to \(expected).")
	}

}
