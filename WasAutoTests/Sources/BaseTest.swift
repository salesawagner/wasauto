//
//  BaseTest.swift
//  WasAutoTests
//
//  Created by Wagner Sales on 25/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

@testable import WasAuto

import XCTest
import SwiftyJSON

class BaseTest: XCTestCase {
	var manufacturerJSON: [String: JSON] {
		let bundle = Bundle(for: BaseTest.self)
		let json = bundle.readJSON(withFileName: "Manufacturer")
		return json?["wkda"].dictionaryValue ?? [:]
	}

	var carJSON: [String: JSON] {
		let bundle = Bundle(for: BaseTest.self)
		let json = bundle.readJSON(withFileName: "Cars")
		return json?["wkda"].dictionaryValue ?? [:]
	}

	var invalidJSON: [String: JSON] {
		return [:]
	}
}
