//
//  ListViewControllerTests.swift
//  WasAutoTests
//
//  Created by Wagner Sales on 25/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

import XCTest
@testable import WasAuto

class ListViewControllerTests: ViewControllerTests {

	func testViewViewModel() {
		let viewModel: ListViewModelProtocol = ManufacturerViewModel()
		let viewController = ListViewController(withViewModel: viewModel)
		self.preloadView(viewController: viewController)
		XCTAssertNotNil(viewController.viewModel, "The view model should be not nil.")
		XCTAssertEqual(viewController.title, viewModel.viewTitle, "The view controller and view model title should be equal.")
	}

	func testLoadData() {

		let expectation = self.expectation(description: #function)
		var viewModel: ListViewModelProtocol = ManufacturerViewModel()
		let viewController = ListViewController(withViewModel: viewModel)

		self.preloadView(viewController: viewController)
		viewModel.dataSourceDidLoad = { success in
			expectation.fulfill()
			viewController.reloadData()
			viewController.stopLoading(hasError: !success)

			let rowsCount = viewController.tableView.numberOfRows(inSection: 0)
			XCTAssertEqual(rowsCount, 15, "The rows and cell count should be 15.")
			XCTAssertEqual(viewController.viewModel.numberOfCells, rowsCount, "The rows and cell count should be equal.")
		}
		self.waitForExpectations(timeout: 60, handler: nil)
	}
}
