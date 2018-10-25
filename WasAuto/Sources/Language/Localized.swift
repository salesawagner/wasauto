//
//  Localized.swift
//  WasAuto
//
//  Created by Wagner Sales on 23/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

import Foundation

typealias L = Localized
struct Localized {

	// MARK: - NAVBAR

	static var list: String {
		return "LIST".localized
	}

	static var manufacturers: String {
		return "MANUFACTURERS".localized
	}

	// MARK: - LOADING

	static var wait: String {
		return "WAIT".localized
	}

	static var loading: String {
		return "LOADING".localized
	}

	// MARK: - ALERT

	static var attention: String {
		return "ATTENTION".localized
	}

	static var sorry: String {
		return "SORRY".localized
	}

	static var somethingWentWrong: String {
		return "SOMETHING_WRONG".localized
	}

	// MARK: - MESSAGES

	static var emptyMessage: String {
		return "EMPTY_MESSAGE".localized
	}
}
