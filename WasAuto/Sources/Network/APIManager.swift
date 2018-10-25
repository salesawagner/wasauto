//
//  APIManager.swift
//  WasAuto
//
//  Created by Wagner Sales on 23/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

import Alamofire
import SwiftyJSON

class APIManager {

	private class func page(value: Any) -> (Int, Int)? {
		let json = JSON(value)
		guard let currentPage = json["page"].int, let totalPages = json["totalPageCount"].int else { return nil }

		return (currentPage, totalPages)
	}

	private class func response(value: Any) -> [String: JSON]? {
		let json = JSON(value)
		guard let response = json["wkda"].dictionary else { return nil }

		return response
	}

	private class func request(
		_ url: URLConvertible,
		method: HTTPMethod = .get,
		parameters: Parameters? = nil,
		encoding: ParameterEncoding = URLEncoding.default,
		headers: HTTPHeaders? = nil)
		-> DataRequest {
		return Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
	}

	class func manufacturerList(page: Int, completion: @escaping ModelListHandler) {

		let url = API.manufacturer()
		let parameters = API.createParameters(page: page)

		self.request(url, method: .get, parameters: parameters).responseJSON { response in
			guard
				let value = response.result.value,
				let (currentPage, totalPages) = self.page(value: value),
				let response = self.response(value: value) else {
					completion(0, 0, [], false)
					return
			}

			let results = Manufacturer.arrayFromJson(response)
			completion(currentPage, totalPages, results, true)
		}
	}

	class func carList(
		withManufacturerId manufacturerId: String,
		page: Int,
		completion: @escaping ModelListHandler) {

		let url = API.car(withManufacturerId: manufacturerId)
		var parameters = API.createParameters(page: page)
		parameters["manufacturer"] = manufacturerId

		self.request(url, method: .get, parameters: parameters).responseJSON { response in
			guard
				let value = response.result.value,
				let (currentPage, totalPages) = self.page(value: value),
				let response = self.response(value: value) else {
					completion(0, 0, [], false)
					return
			}

			let results = Car.arrayFromJson(response)
			completion(currentPage, totalPages, results, true)
		}
	}
}
