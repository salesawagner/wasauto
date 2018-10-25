//
//  CellViewModel.swift
//  WasAuto
//
//  Created by Wagner Sales on 23/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

import UIKit

class CellViewModel {

	// MARK: - Properties

	let title: String
	let backgroundColor: UIColor

	// MARK: - Constructors

	required init(model: ModelProtocol, row: Int) {
		self.title = model.name
		if row%2 == 0 {
			self.backgroundColor = UIColor.Style.darkBackground
		} else {
			self.backgroundColor = UIColor.Style.lightground
		}
	}
}
