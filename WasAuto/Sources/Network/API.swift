//
//  API.swift
//  WasAuto
//
//  Created by Wagner Sales on 23/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

class API {

	// MARK: - Private Properties

	static private let defaultPageSize: Int = 15
	static private let key: String = "wa_key"
	static private let keyValue: String = "coding-puzzle-client-449cc9d"

	static private let version: String = "v1/"
	static private let types: String = "car-types/"
	static private let baseURL: String = "http://api-aws-eu-qa-1.auto1-test.com/"

	// MARK: - Internal Methods

	class func manufacturer() -> String {
		var url = self.baseURL
		url += self.version
		url += self.types
		url += "manufacturer"

		return url
	}

	class func car(withManufacturerId: String) -> String {
		var url = self.baseURL
		url += self.version
		url += self.types
		url += "main-types"

		return url
	}

	class func createParameters(page: Int, pageSize: Int = API.defaultPageSize) -> [String: Any] {
		var parameters: [String: Any] = [:]
		parameters["page"] = page
		parameters["pageSize"] = pageSize
		parameters[self.key] = self.keyValue

		return parameters
	}
}
