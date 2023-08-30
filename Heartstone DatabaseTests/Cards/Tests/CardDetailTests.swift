//
//  CardDetailTests.swift
//  Heartstone DatabaseTests
//
//  Created by Fabio Augusto Resende on 30/08/23.
//

import XCTest
@testable import Heartstone_Database

final class CardDetailTest: XCTestCase {
    
    func testCardDetailRequest() async {
        do {
            let cardsResponse = try await CardClient().getCardBy(id: "HERO_11bpt")
            XCTAssertTrue(cardsResponse.count > 0)
        } catch {
            XCTFail("Request error")
        }
    }
        
    func testMockCardDetailInteractorRequest() {
        let controller = CardDetailRouter.factory(id: "HERO_11bpt", client: CardsMockClient(), navigation: UINavigationController())
                
        let expectation = XCTestExpectation(description: "card loaded")
        
        controller.interactor.fetchCardBy(id: controller.id)
        
        let result = XCTWaiter().wait(for: [expectation], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(controller.card?.cardId != nil)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testMockEmptyCardDetailInteractorRequest() {
        let controller = CardDetailRouter.factory(id: "HERO_11bpt", client: CardsMockClientWithEmptyData(), navigation: UINavigationController())
                
        let expectation = XCTestExpectation(description: "card loaded")
        
        controller.interactor.fetchCardBy(id: controller.id)
        
        let result = XCTWaiter().wait(for: [expectation], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(controller.card?.cardId != nil)
        } else {
            XCTFail("Delay interrupted")
        }
    }
}
