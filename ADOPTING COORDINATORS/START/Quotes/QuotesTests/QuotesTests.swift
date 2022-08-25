//
//  QuotesTests.swift
//  QuotesTests
//
//  Created by Juan Daniel Rodrgiuez Perez on 03/01/22.
//  Copyright © 2022 Code Foundry. All rights reserved.
//

import XCTest

import XCTest
@testable import Quotes

class StoryboardableTests: XCTestCase {
    func testQuotesViewController() {
        _ = QuotesViewController.instantiate()
    }
    func testSettingsViewController() {
        _ = SettingsViewController.instantiate()
    }
}
