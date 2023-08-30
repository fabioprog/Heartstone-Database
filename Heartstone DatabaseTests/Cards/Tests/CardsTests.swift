//
//  CardsTests.swift
//  Heartstone DatabaseTests
//
//  Created by Fabio Augusto Resende on 30/08/23.
//

import XCTest
@testable import Heartstone_Database

final class CardsTest: XCTestCase {
    
    func testCardsRequest() async {
        do {
            let cardsResponse = try await CardClient().getCardsBy(setName: "Basic")
            XCTAssertTrue(cardsResponse.count > 0)
        } catch {
            XCTFail("Request error")
        }
    }
        
    func testMockCardsInteractorRequest() {
        let controller = CardsRouter.factory(setName: "Basic", client: CardsMockClient(), navigation: UINavigationController())
                
        let expectation = XCTestExpectation(description: "cards loaded")
        
        controller.interactor.fetchCardsBy(setName: controller.setName)
        
        let result = XCTWaiter().wait(for: [expectation], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(controller.cards.count > 0)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testMockEmptyCardsInteractorRequest() {
        let controller = CardsRouter.factory(setName: "Basic", client: CardsMockClientWithEmptyData(), navigation: UINavigationController())
                
        let expectation = XCTestExpectation(description: "cards loaded")
        
        controller.interactor.fetchCardsBy(setName: controller.setName)
        
        let result = XCTWaiter().wait(for: [expectation], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(controller.cards.count > 0)
        } else {
            XCTFail("Delay interrupted")
        }
    }
}
