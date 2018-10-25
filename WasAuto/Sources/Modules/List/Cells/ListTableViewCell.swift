//
//  ListTableViewCell.swift
//  WasAuto
//
//  Created by Wagner Sales on 23/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

	// MARK: - Static Properties

	private static let _describing: String = String(describing: ListTableViewCell.self)
	static let nib: UINib = UINib(nibName: _describing, bundle: nil)
	static let identifier: String = String(describing: _describing)

	// MARK: - Internal Methods

	func setup(withCellViewModel viewModel: CellViewModel) {
		self.textLabel?.text = viewModel.title
		self.backgroundColor = viewModel.backgroundColor
	}
}
