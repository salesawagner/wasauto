//
//  Manufacturer.swift
//  WasAuto
//
//  Created by Wagner Sales on 23/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

import SwiftyJSON

class Manufacturer: ModelProtocol {

	let id: String
	let name: String

	required init(id: String, name: String) {
		self.id = id
		self.name = name
	}
}
