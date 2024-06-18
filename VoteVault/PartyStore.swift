//
//  PartyStore.swift
//  VoteVault
//
//  Created by Jiri Janecek on 18.06.2024.
//

import Foundation

final class PartyStore: ObservableObject {
    @Published var parties: [PartyModel] = []
    private(set) var isPercentageSumCorrect = true
    
    private var partiesInternal: [PartyModel] = [] {
        didSet {
            self.isPercentageSumCorrect = self.partiesInternal.compactMap({ $0.percents }).reduce(0.0, +) <= 100.0
            self.parties = self.partiesInternal
        }
    }
    
    func deleteAll() {
        self.parties.removeAll()
    }
    
    // MARK: - For development purposes
    
    var isA = true
    
    func change() {
        if self.isA {
            self.assignB()
        } else {
            self.assignA()
        }
        
        self.isA.toggle()
    }
    
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
