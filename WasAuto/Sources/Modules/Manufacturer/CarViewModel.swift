//
//  CarViewModel.swift
//  WasAuto
//
//  Created by Wagner Sales on 24/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

import UIKit

class CarViewModel: ListViewModel, ListViewModelProtocol {
	func loadDataSource(loadType: LoadType = .refresh) {
		self.prepareToLoad(loadType: loadType)
		guard let model = self.model else {
			self.dataSourceDidLoad?(false)
			return
		}

		APIManager.carList(
		withManufacturerId: model.id,
		page: self.nextPage) { (currentPage, totalPages, dataSource, success) in
			self.currentPage = currentPage
			self.totalPages = totalPages
			self.setDataSource(loadType: loadType, dataSource: dataSource)
			self.dataSourceDidLoad?(success)
		}
	}

	func cellAccessoryType() -> UITableViewCell.AccessoryType {
		return .detailButton
	}

	func didSelectRow(indexPath: IndexPath) {
		let model = self.dataSource[indexPath.row]
		let manufacturer = self.model
		let message = "\(manufacturer?.name ?? "undefined") - \(model.name)"
		self.showAlert?(message)
	}
}
