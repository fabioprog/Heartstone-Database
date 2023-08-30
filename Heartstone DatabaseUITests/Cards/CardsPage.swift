//
//  CardsPage.swift
//  Heartstone DatabaseUITests
//
//  Created by Fabio Augusto Resende on 30/08/23.
//

import XCTest

public class CardsPage: BaseTest {
    
    override var rootElement: XCUIElement {
        return tableView(SetsAccessibilityStrings.tableViewId.text)
    }
    
    @discardableResult
    func tapSetItem() -> Self {
        if tableView(SetsAccessibilityStrings.tableViewId.text)
            .cells.firstMatch.waitForExistence(timeout: 5) {
            
            tableView(SetsAccessibilityStrings.tableViewId.text)
                .cells.firstMatch.tap()
        }
        return self
    }
    
    @discardableResult
    func tapCardItem() -> Self {
        if tableView(CardsAccessibilityStrings.cardsTableViewId.text)
            .cells.firstMatch.waitForExistence(timeout: 10) {
            
            tableView(CardsAccessibilityStrings.cardsTableViewId.text)
                .cells.firstMatch.tap()
        }
        return self
    }
    
    @discardableResult
    func popNavigation() -> Self {
        navigationBar(SetsAccessibilityStrings.navigationBarId.text)
            .buttons
            .element(boundBy: 0)
            .tap()
        return self
    }
}
