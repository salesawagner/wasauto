//
//  AppDelegate.swift
//  WasAuto
//
//  Created by Wagner Sales on 23/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	typealias AppOptions = [UIApplication.LaunchOptionsKey: Any]

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: AppOptions?) -> Bool {

		let viewModel = ManufacturerViewModel(withTitle: L.manufacturers)
		let listViewController = ListViewController(withViewModel: viewModel)
		let rootViewController = UINavigationController(rootViewController: listViewController)

		let window = UIWindow(frame: UIScreen.main.bounds)
		window.rootViewController = rootViewController
		window.makeKeyAndVisible()
		self.window = window

		return true
	}
}
