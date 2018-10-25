//
//  ListViewController.swift
//  WasAuto
//
//  Created by Wagner Sales on 23/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

	// MARK: - Static Properties

	static let nibName: String = String(describing: ListViewController.self)

	// MARK: - Properties

	@IBOutlet weak var tableView: UITableView!

	var viewModel: ListViewModelProtocol
	private var refreshControl: UIRefreshControl!

	// MARK: - Constructors

	init(withViewModel viewModel: ListViewModelProtocol) {
		self.viewModel = viewModel
		super.init(nibName: ListViewController.nibName, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		self.viewModel = ManufacturerViewModel(withTitle: L.list)
		super.init(coder: aDecoder)
	}

	// MARK: - Private Methods

	private func setups() {
		self.setupViewModel()
		self.setupTitle()
		self.setupRefreshControl()
		self.setuptableView()
	}

	private func setupViewModel() {
		self.viewModel.pushToViewController = { [weak self] viewModel in
			guard let navigationController = self?.navigationController else { return }
			let listViewController = ListViewController(withViewModel: viewModel)
			navigationController.pushViewController(listViewController, animated: true)
		}

		self.viewModel.showAlert = { [weak self] message in
			self?.showAlert(subtitle: message)
		}
	}

	private func setupTitle() {
		self.title = self.viewModel.viewTitle
	}

	private func setupRefreshControl() {
		let selector = #selector(self.didRefresh(_:))
		self.refreshControl = UIRefreshControl()
		self.refreshControl.addTarget(self, action: selector, for: .valueChanged)
	}

	private func setuptableView() {
		self.tableView.sectionFooterHeight = 0
		self.tableView.showsVerticalScrollIndicator = false
		self.tableView.showsHorizontalScrollIndicator = false
		self.tableView.backgroundColor = UIColor.clear
		self.tableView.tableFooterView = UIView()
		self.tableView.addSubview(self.refreshControl)
		self.tableView.placeholderDelegate = self
		self.tableView.placeholder(isShow: false)

		let nib = ListTableViewCell.nib
		let identifier = ListTableViewCell.identifier
		self.tableView.register(nib, forCellReuseIdentifier: identifier)
	}

	@objc func didRefresh(_ refreshControl: UIRefreshControl) {
		self.fetchData(useLoading: false) { _ in
			self.refreshControl.endRefreshing()
		}
	}

    private func fetchData(
		useLoading: Bool = true,
		loadType: ListViewModel.LoadType = .refresh,
		completion: CompletionSuccess? = nil) {

		if useLoading {
			self.startLoading()
		}

		self.viewModel.loadDataSource(loadType: loadType)
		self.viewModel.dataSourceDidLoad = { success in
			self.reloadData()
			self.stopLoading(hasError: !success)
			completion?(success)
		}
	}

	// MARK: - Internal Methods

	override func viewDidLoad() {
		super.viewDidLoad()
		self.setups()
		self.fetchData()
	}

	func reloadData() {
		self.tableView.reloadData()
		self.tableView.placeholder(isShow: self.viewModel.numberOfCells == 0, animate: true)
	}
}

// MARK: - UITableViewDataSource

extension ListViewController: UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.viewModel.numberOfCells
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		var cell: UITableViewCell!
		let identifier: String = ListTableViewCell.identifier

		if let listCell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ListTableViewCell {
			let cellViewModel = self.viewModel.getCellViewModel(indexPath: indexPath)
			listCell.setup(withCellViewModel: cellViewModel)
			cell = listCell
		} else {
			cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
		}

		cell.accessoryType = self.viewModel.cellAccessoryType()

		return cell
	}
}

// MARK: - UITableViewDelegate

extension ListViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.viewModel.didSelectRow(indexPath: indexPath)
	}

	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

		let lastRowIndex = tableView.numberOfRows(inSection: indexPath.section) - 1
		guard lastRowIndex == indexPath.row && self.viewModel.hasNextPage else { return }

		self.fetchData(useLoading: false, loadType: .nextPage)
	}
}

// MARK: - UITableViewPlaceholderDelegate

extension ListViewController: UITableViewPlaceholderDelegate {
	func placeholderViewModel(in tableView: UITableView) -> PlaceholderViewModel {
		let image = UIImage(named: "smile-sad")
		let placeholder = PlaceholderViewModel(image: image, title: L.sorry, message: L.emptyMessage)
		return placeholder
	}
}
