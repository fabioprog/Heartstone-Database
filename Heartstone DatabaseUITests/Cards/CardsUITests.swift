//
//  CardsUITests.swift
//  Heartstone DatabaseUITests
//
//  Created by Fabio Augusto Resende on 30/08/23.
//

import XCTest

final class CharactersUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testCardDetailNavigation() {
        CardsPage()
            .tapSetItem()
            .tapCardItem()
            .popNavigation()
            .popNavigation()
    }
        
    //MARK: Performance Tests
    func testLaunchPerformance() throws {
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
