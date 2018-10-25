//
//  ListViewModelTests.swift
//  WasAutoTests
//
//  Created by Wagner Sales on 25/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

import XCTest
@testable import WasAuto

class ListViewModelTests: BaseTest {

	func testInitialization() {
		let listViewModel = ListViewModel()
		let cellViewModels = listViewModel.cellViewModels
		XCTAssertNotNil(listViewModel, "The list view model should not be nil.")
		XCTAssertNotNil(cellViewModels, "The cell view models should not be nil.")
	}

}
