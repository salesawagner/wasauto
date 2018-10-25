//
//  UIViewControllerExtensions.swift
//  WasAuto
//
//  Created by Wagner Sales on 23/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

import UIKit
import SCLAlertView

private var kLoadingAssociationKey: UInt8 = 0

extension UIViewController {

	var loading: SCLAlertViewResponder? {
		get {
			return objc_getAssociatedObject(self, &kLoadingAssociationKey) as? SCLAlertViewResponder
		}
		set(newValue) {
			let policy = objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN
			objc_setAssociatedObject(self, &kLoadingAssociationKey, newValue, policy)
		}
	}

	func startLoading(_ title: String = L.wait, subtitle: String = L.loading) {
		if self.loading == nil {
			let app = SCLAlertView.SCLAppearance(showCloseButton: false)
			let loading = SCLAlertView(appearance: app)
			let colorStyle = UIColor.Style.blueColor.colorToUInt()
			self.loading = loading.showWait(title, subTitle: subtitle, colorStyle: colorStyle)
		}
	}

	func stopLoading(hasError error: Bool = false) {
		if let loading = self.loading {
			loading.setDismissBlock({
				self.loading = nil
				if error {
					self.showError()
					return
				}
			})
			loading.close()
		}
	}

	func showAlert(title: String = L.attention, subtitle: String, style: SCLAlertViewStyle = .warning) {
		let colorStyle = UIColor.Style.redColor.colorToUInt()
		SCLAlertView().showTitle(title, subTitle: subtitle, style: style, colorStyle: colorStyle)
	}

	func showError() {
		let title = L.sorry
		let subtitle = L.somethingWentWrong
		self.showAlert(title: title, subtitle: subtitle, style: .error)
	}

	class var visible: UIViewController? {
		guard
			let appDelegate = UIApplication.shared.delegate as? AppDelegate,
			let window = appDelegate.window,
			let visible = window.visibleViewController else {
				return nil
		}
		return visible
	}

	func preloadView() {
		_ = view
	}
}
