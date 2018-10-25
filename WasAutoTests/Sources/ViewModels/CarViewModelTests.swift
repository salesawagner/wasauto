//
//  CarViewModelTests.swift
//  WasAutoTests
//
//  Created by Wagner Sales on 25/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

import XCTest
@testable import WasAuto

class CarViewModelTests: BaseTest {

	func testLoadCars() {

		let expectation = self.expectation(description: #function)
		let model = Manufacturer(id: "130", name: "BMW")
		var listViewModel: ListViewModelProtocol = CarViewModel(withModel: model)

		listViewModel.dataSourceDidLoad = { success in
			expectation.fulfill()
			XCTAssert(success, "success should be true")
			XCTAssertEqual(listViewModel.numberOfCells, 15, "The numberOfCells should be equal to 10")
			XCTAssert(listViewModel.hasNextPage, "hasNextPage should be true")

			let indexPath = IndexPath(row: 0, section: 0)
			let cellViewModel = listViewModel.getCellViewModel(indexPath: indexPath)
			XCTAssertNotNil(cellViewModel, "getCellViewModel should not be nil")
		}
		listViewModel.loadDataSource(loadType: .refresh)
		self.waitForExpectations(timeout: 60, handler: nil)
	}

	func testLoadCarsInvalidId() {

		let expectation = self.expectation(description: #function)
		var listViewModel: ListViewModelProtocol = CarViewModel()

		listViewModel.dataSourceDidLoad = { success in
			expectation.fulfill()
			XCTAssertFalse(success, "success should be false")
			XCTAssertEqual(listViewModel.numberOfCells, 0, "The numberOfCells should be equal to 0")
			XCTAssertFalse(listViewModel.hasNextPage, "hasNextPage should be false")
		}
		listViewModel.loadDataSource(loadType: .refresh)
		self.waitForExpectations(timeout: 60, handler: nil)
	}

	func testCarViewModelInvalidId() {

		let expectation = self.expectation(description: #function)
		var listViewModel: ListViewModelProtocol = CarViewModel()

		listViewModel.dataSourceDidLoad = { success in
			expectation.fulfill()
			XCTAssertFalse(success, "success should be false")
			XCTAssertEqual(listViewModel.numberOfCells, 0, "The numberOfCells should be equal to 0")
			XCTAssertFalse(listViewModel.hasNextPage, "hasNextPage should be false")
		}
		listViewModel.loadDataSource(loadType: .refresh)
		self.waitForExpectations(timeout: 60, handler: nil)
	}

}
