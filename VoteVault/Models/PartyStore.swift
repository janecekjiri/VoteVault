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
    
    func removeParty(atOffsets indexSet: IndexSet) {
        self.partiesInternal.remove(atOffsets: indexSet)
    }
}
