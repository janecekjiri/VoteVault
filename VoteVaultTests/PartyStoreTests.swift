//
//  PartyStoreTests.swift
//  VoteVaultTests
//
//  Created by Jiri Janecek on 18.06.2024.
//

import XCTest
@testable import VoteVault

final class PartyStoreTests: XCTestCase {
    var partyStore: PartyStore!
    
    override func setUp() {
        super.setUp()
        self.partyStore = PartyStore()
    }
    
    override func tearDown() {
        self.partyStore = nil
        super.tearDown()
    }
    
    func test_whenInitialized_partiesAreEmpty() {
        XCTAssertTrue(self.partyStore.parties.isEmpty)
    }
    
    func test_whenDeleteAllParties_partiesAreEmpty() {
        self.partyStore.assignA()
        self.partyStore.deleteAll()
        XCTAssertTrue(self.partyStore.parties.isEmpty)
    }
    
    func test_whenPercentageSumIsBelow100_percentageSumIsCorrect() {
        self.partyStore.assignA()
        XCTAssertTrue(self.partyStore.isPercentageSumCorrect)
    }
    
    func test_whenPercentageSumIsAbove100_percentageSumIsIncorrect() {
        self.partyStore.assignB()
        XCTAssertFalse(self.partyStore.isPercentageSumCorrect)
    }

}
