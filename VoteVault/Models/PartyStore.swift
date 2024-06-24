//
//  PartyStore.swift
//  VoteVault
//
//  Created by Jiri Janecek on 18.06.2024.
//

import Foundation

final class PartyStore: ObservableObject {
    @Published private(set) var parties: [PartyModel] = []
    private(set) var isPercentageSumCorrect = true
    
    private var partiesInternal: [PartyModel] = [] {
        didSet {
            self.isPercentageSumCorrect = self.partiesInternal.compactMap({ $0.percents }).reduce(0.0, +) <= 100.0
            self.parties = self.partiesInternal
        }
    }
    
    func deleteAll() {
        self.partiesInternal.removeAll()
    }
    
    func addParty(_ party: PartyModel) {
        if let index = self.partiesInternal.firstIndex(where: { $0.name == party.name }) {
            self.partiesInternal[index] = party
        } else {
            self.partiesInternal.append(party)
        }
    }
    
    func removeParty(_ party: PartyModel) {
        self.partiesInternal.removeAll { $0.name == party.name }
    }
    
    // MARK: - For development and testing purposes
    
    func assignA() {
        self.partiesInternal = [
            PartyModel(name: "ODS", percents: 12.9, color: .blue, isCoaliton: false),
            PartyModel(name: "ANO", percents: 33.4, color: .purple, isCoaliton: false),
            PartyModel(name: "Piráti", percents: 9.8, color: .black, isCoaliton: false)
        ]
    }
    
    func assignB() {
        self.partiesInternal = [
            PartyModel(name: "ODS", percents: 12.9, color: .blue, isCoaliton: false),
            PartyModel(name: "ANO", percents: 33.4, color: .purple, isCoaliton: false),
            PartyModel(name: "Piráti", percents: 9.8, color: .black, isCoaliton: false),
            PartyModel(name: "SPD", percents: 90.8, color: .brown, isCoaliton: false)
        ]
    }
}
