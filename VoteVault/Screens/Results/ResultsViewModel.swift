//
//  ResultsViewModel.swift
//  VoteVault
//
//  Created by Jiri Janecek on 23.06.2024.
//

import Foundation

final class ResultsViewModel: ObservableObject {
    var parties: [PartyModel] = [] {
        didSet {
            self.calculate()
        }
    }
    
    @Published var finalParties: [PartyModel] = []
    
    private func calculate() {
        // Filter out parties below the minimal treshhold
        var finalParties = self.parties.filter { $0.percents ?? 0.0 > ($0.isCoaliton ? 7.0 : 5.0) }
        
        let sumPercentages = finalParties.compactMap { $0.percents }.reduce(0.0, +)
        
        finalParties.forEach { party in
            party.mandates = Int(200.0 * (party.percents ?? 0.0) / sumPercentages)
        }
        
        finalParties.sort { $0.mandates > $1.mandates }
        
        self.finalParties = finalParties
    }
}
