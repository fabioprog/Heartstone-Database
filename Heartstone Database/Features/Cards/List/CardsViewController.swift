//
//  CardsViewController.swift
//  Heartstone Database
//
//  Created by Fabio Augusto Resende on 28/08/23.
//

import UIKit

protocol CardsViewControllerProtocol: AnyObject {
    func didReceive(cards: [Card])
    func didReceive(error: String)
}

class CardsViewController: BaseViewController<CardsView> {
    
    var interactor: CardsInteractorProtocol
    var router: CardsRouterProtocol
    var setName: String
    var cards: [Card] = [] {
        didSet {
            customView.hideLoadingView()
            customView.tableView.reloadData()
            setupAccessibility()
        }
    }
    
    required init(setName: String, interactor: CardsInteractorProtocol, router: CardsRouterProtocol) {
        self.setName = setName
        self.interactor = interactor
        self.router = router
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = setName
        setupTableView()
        fetchData()
    }
    
    func setupTableView() {
        customView.tableView.dataSource = self
        customView.tableView.delegate = self
    }
    
    func fetchData() {
        customView.showLoadingView()
        interactor.fetchCardsBy(setName: setName)
    }
    
    func setupAccessibility() {
        customView.tableView.setAccessibility(label:
                                                CardsAccessibilityStrings.cardsTableViewLabel.localized(setName))
    }
}

extension CardsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CardsTableViewCell.identifier, for: indexPath) as? CardsTableViewCell else {
            return UITableViewCell()
        }
        cell.setupData(card: cards[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.navigateToCardDetail(by: cards[indexPath.row].cardId)
    }
}

extension CardsViewController: CardsViewControllerProtocol {
    func didReceive(cards: [Card]) {
        self.cards = cards
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
        { [weak self] _ in
            guard let self = self else { return }
            self.router.back()
        }
    }
}
