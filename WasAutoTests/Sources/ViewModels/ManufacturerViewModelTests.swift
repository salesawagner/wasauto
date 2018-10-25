//
//  ManufacturerViewModelTests.swift
//  WasAutoTests
//
//  Created by Wagner Sales on 25/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

import XCTest
@testable import WasAuto

class ManufacturerViewModelTests: BaseTest {

	func testLoadManufacturers() {

		let expectation = self.expectation(description: #function)
		var listViewModel: ListViewModelProtocol = ManufacturerViewModel()

		listViewModel.dataSourceDidLoad = { success in
			expectation.fulfill()
			XCTAssert(success, "success should be true")
			XCTAssertEqual(listViewModel.numberOfCells, 15, "The numberOfCells should be equal to 15")
			XCTAssert(listViewModel.hasNextPage, "hasNextPage should be true")

			let indexPath = IndexPath(row: 0, section: 0)
			let cellViewModel = listViewModel.getCellViewModel(indexPath: indexPath)
			XCTAssertNotNil(cellViewModel, "getCellViewModel should not be nil")
		}
		listViewModel.loadDataSource(loadType: .refresh)
		self.waitForExpectations(timeout: 60, handler: nil)
	}

}
