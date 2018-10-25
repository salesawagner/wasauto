//
//  ManufacturerViewModel.swift
//  WasAuto
//
//  Created by Wagner Sales on 23/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

import UIKit

class ManufacturerViewModel: ListViewModel, ListViewModelProtocol {
	func loadDataSource(loadType: LoadType = .refresh) {
		self.prepareToLoad(loadType: loadType)
		APIManager.manufacturerList(page: self.nextPage) { response in

			var success: Bool = false
			switch response {
			case .Success(let currentPage, let totalPages, let dataSource):
				self.currentPage = currentPage
				self.totalPages = totalPages
				self.setDataSource(loadType: loadType, dataSource: dataSource)
				success = true
			default: break
			}

			self.dataSourceDidLoad?(success)
		}
	}

	func cellAccessoryType() -> UITableViewCell.AccessoryType {
		return .disclosureIndicator
	}

	func didSelectRow(indexPath: IndexPath) {
		let model = self.dataSource[indexPath.row]
		let carViewModel = CarViewModel(withModel: model, title: "\(model.name) cars list")
		self.pushToViewController?(carViewModel)
	}
}
