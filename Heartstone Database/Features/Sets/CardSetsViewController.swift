//
//  CardSetsViewController.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import UIKit

protocol CardSetsViewControllerProtocol: AnyObject {
    func didReceive(sets: [String])
    func didReceive(error: String)
}

class CardSetsViewController: BaseViewController<CardSetsView> {
    
    var interactor: CardSetsInteractorProtocol
    var router: CardSetsRouterProtocol
    var sets: [String] = [] {
        didSet {
            customView.hideLoadingView()
            customView.tableView.refreshControl?.endRefreshing()
            customView.tableView.reloadData()
        }
    }
    
    required init(interactor: CardSetsInteractorProtocol, router: CardSetsRouterProtocol) {
        self.interactor = interactor
        self.router = router
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = SetsStrings.title.text
        
        setupTableView()
        fetchData()
    }
    func setupTableView() {
        customView.tableView.dataSource = self
        customView.tableView.delegate = self
        customView.tableView.refreshControl = UIRefreshControl()
        customView.tableView.refreshControl?.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
    }
    
    func fetchData() {
        customView.showLoadingView()
        interactor.fetchCardSets()
    }
    
    @objc func didPullToRefresh() {
        customView.tableView.refreshControl?.beginRefreshing()
        interactor.fetchCardSets()
    }
}

extension CardSetsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sets.count == 0 {
            customView.tableView.setEmptyMessage(SetsStrings.tableViewEmptyMessage.text)
        } else {
            customView.tableView.removeEmptyMessage()
        }
        return sets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CardSetsTableViewCell.identifier, for: indexPath) as? CardSetsTableViewCell else {
            return UITableViewCell()
        }
        cell.setupData(setName: sets[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.navigateToCards(setName: sets[indexPath.row])
    }
}

extension CardSetsViewController: CardSetsViewControllerProtocol {
    func didReceive(sets: [String]) {
        self.sets = sets
    }
    
    func didReceive(error: String) {
        customView.hideLoadingView()
        presentAlert(title: BaseStrings.errorTitle.text,
                     message: error,
                     style: .alert,
                     options:
                        [(title: BaseStrings.ok.text,
                          style: UIAlertAction.Style.default,
                          uiIdentifier: "")])
    }
}
