//
//  BaseTest.swift
//  Heartstone DatabaseUITests
//
//  Created by Fabio Augusto Resende on 30/08/23.
//

import XCTest

class Logger {
    func log(_ log: String) {
        NSLog(log)
    }
}

public class BaseTest {
    let app = XCUIApplication()
    let log = Logger().log
    
    required init(timeout: TimeInterval = 10) {
        log("Waiting \(timeout)s for \(String(describing: self)) existence")
        XCTAssert(rootElement.waitForExistence(timeout: timeout), "\(String(describing: self)) not loaded")
    }
    
    // Necessário dar override no rootElement para saber se a tela foi inicializada
    var rootElement: XCUIElement {
        fatalError("subclass should override rootElement")
    }
    
    @discardableResult
    func dismissKeyboard() -> Self {
        app.children(matching: .window).firstMatch.tap()
        return self
    }
    
    func button(_ name: String) -> XCUIElement {
        return app.buttons[name]
    }
    
    func navigationBar(_ name :String) -> XCUIElement {
        return app.navigationBars[name]
    }
    
    func label(_ name :String) -> XCUIElement {
        return app.staticTexts[name]
    }
    
    func textField(_ name :String) -> XCUIElement {
        return app.textFields[name]
    }

    func tableView(_ name :String) -> XCUIElement {
        return app.tables[name]
    }
    
    func imageView(_ name :String) -> XCUIElement {
        return app.images[name]
    }
}
