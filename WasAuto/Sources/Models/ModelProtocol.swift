//
//  ModelProtocol.swift
//  WasAuto
//
//  Created by Wagner Sales on 23/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol ModelProtocol {
	var id: String { get }
	var name: String { get }
	init(id: String, name: String)
}

extension ModelProtocol {
	static func arrayFromJson(_ dictionary: [String: JSON]) -> [ModelProtocol] {

		var result: [ModelProtocol] = []
		let keys = dictionary.keys.sorted()

		for key in keys {
			if let value = dictionary[key], let name = value.string {
				let manufacturer = Self(id: key, name: name)
				result.append(manufacturer)
			}
		}

		return result
	}
}
