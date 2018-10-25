//
//  ListViewModel.swift
//  WasAuto
//
//  Created by Wagner Sales on 23/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

import UIKit

protocol ListViewModelProtocol {

	var model: ModelProtocol? { get }
	var viewTitle: String { get }
	var numberOfCells: Int { get }
	var hasNextPage: Bool { get }

	var dataSourceDidLoad: CompletionSuccess? { get set }
	var pushToViewController: PushWithModel? { get set }
	var showAlert: AlertWithMessage? { get set }

	func getCellViewModel(indexPath: IndexPath) -> CellViewModel
	func cellAccessoryType() -> UITableViewCell.AccessoryType
	func loadDataSource(loadType: ListViewModel.LoadType)
	func didSelectRow(indexPath: IndexPath)
}

class ListViewModel {

	enum LoadType {
		case refresh
		case nextPage
	}

	// MARK: - Properties

	var model: ModelProtocol?
	var currentPage: Int = 1
	var totalPages: Int = 1
	var nextPage: Int {
		return self.currentPage == self.totalPages ? self.currentPage : self.currentPage + 1
	}
	var dataSource: [ModelProtocol] = [] {
		didSet {
			var cellViewModels: [CellViewModel] = []
			for (row, model) in self.dataSource.enumerated() {
				cellViewModels.append(CellViewModel(model: model, row: row))
			}
			self.cellViewModels = cellViewModels
		}
	}
	var cellViewModels: [CellViewModel] = []

	// MARK: - Protocol Properties

	var viewTitle: String
	var numberOfCells: Int {
		return self.cellViewModels.count
	}
	var dataSourceDidLoad: CompletionSuccess?
	var pushToViewController: PushWithModel?
	var showAlert: AlertWithMessage?
	var hasNextPage: Bool {
		return self.nextPage < self.totalPages
	}

	// MARK: - Constructors

	init(withTitle title: String = L.list) {
		self.viewTitle = title
	}

	convenience init(withModel model: ModelProtocol, title: String = L.list) {
		self.init(withTitle: title)
		self.model = model
	}

	// MARK: - Internal Methods

	func getCellViewModel(indexPath: IndexPath) -> CellViewModel {
		return self.cellViewModels[indexPath.row]
	}

	func prepareToLoad(loadType: LoadType) {
		if loadType == .refresh {
			self.currentPage = 0
			self.totalPages = 0
		}
	}

	func setDataSource(loadType: LoadType, dataSource: [ModelProtocol]) {
		if loadType == .refresh {
			self.dataSource = dataSource
		} else if loadType == .nextPage {
			self.dataSource.append(contentsOf: dataSource)
		}
	}
}
