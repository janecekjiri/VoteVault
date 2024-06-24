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
        self.assingPartiesGroupA()
        self.partyStore.deleteAll()
        XCTAssertTrue(self.partyStore.parties.isEmpty)
    }
    
    func test_whenPercentageSumIsBelow100_percentageSumIsCorrect() {
        self.assingPartiesGroupA()
        XCTAssertTrue(self.partyStore.isPercentageSumCorrect)
    }
    
    func test_whenPercentageSumIsAbove100_percentageSumIsIncorrect() {
        self.assingPartiesGroupB()
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
    
    // MARK: - Helper methods
    
    func assingPartiesGroupA() {
        [
            PartyModel(name: "ODS", percents: 12.9, color: .blue, isCoaliton: false),
            PartyModel(name: "ANO", percents: 33.4, color: .purple, isCoaliton: false),
            PartyModel(name: "Piráti", percents: 9.8, color: .black, isCoaliton: false)
        ].forEach { self.partyStore.addParty($0) }
    }
    
    func assingPartiesGroupB() {
        [
            PartyModel(name: "ODS", percents: 12.9, color: .blue, isCoaliton: false),
            PartyModel(name: "ANO", percents: 33.4, color: .purple, isCoaliton: false),
            PartyModel(name: "Piráti", percents: 9.8, color: .black, isCoaliton: false),
            PartyModel(name: "SPD", percents: 90.8, color: .brown, isCoaliton: false)
        ].forEach { self.partyStore.addParty($0) }
    }

}
