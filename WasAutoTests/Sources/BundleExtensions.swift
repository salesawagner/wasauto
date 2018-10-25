//
//  BundleExtensions.swift
//  WasAutoTests
//
//  Created by Wagner Sales on 25/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

import Foundation
import SwiftyJSON

extension Bundle {
	func readJSON(withFileName name: String) -> JSON? {

		guard let path = self.url(forResource: name, withExtension: "json") else {
			return nil
		}

		do {
			let data = try Data(contentsOf: path)
			return JSON(data)
		} catch let error {
			print(error)
		}

		return nil
	}
}
