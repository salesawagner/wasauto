//
//  ViewControllerTests.swift
//  WasAutoTests
//
//  Created by Wagner Sales on 25/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

import XCTest
@testable import WasAuto

class ViewControllerTests: BaseTest {
	func preloadView(viewController: UIViewController) {
		UIApplication.shared.keyWindow!.rootViewController = viewController
		viewController.preloadView()
	}
}
