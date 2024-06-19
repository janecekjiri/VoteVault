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
    
    func test_whenPartyIsAdded_thereIsOneParty() {
        self.partyStore.addParty(PartyModel(name: "ODS", percents: 14.7, color: .blue, isCoaliton: false))
        XCTAssertTrue(self.partyStore.parties.count == 1)
    }
    
    func test_whenPartyIsRemoved_thereIsNoParty() {
        let party = PartyModel(name: "ODS", percents: 14.7, color: .blue, isCoaliton: false)
        self.partyStore.addParty(party)
        self.partyStore.removeParty(party)
        XCTAssertTrue(self.partyStore.parties.count == 0)
    }
    
    func test_whenNotSavedPartyIsRemoved_partiesCountDoesNotChange() {
        let party = PartyModel(name: "ODS", percents: 14.7, color: .blue, isCoaliton: false)
        let party2 = PartyModel(name: "ANO", percents: 33.7, color: .purple, isCoaliton: false)
        self.partyStore.addParty(party)
        self.partyStore.removeParty(party2)
        XCTAssertTrue(self.partyStore.parties.count == 1)
    }
    
    func test_whenSamePartyIsAdded_partiesCountDoesNotChange() {
        var party = PartyModel(name: "ODS", percents: 14.7, color: .blue, isCoaliton: false)
        self.partyStore.addParty(party)
        party.percents = 15.8
        self.partyStore.addParty(party)
        XCTAssertTrue(self.partyStore.parties.count == 1)
    }

}
