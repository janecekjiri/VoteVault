//
//  PartyStore.swift
//  VoteVault
//
//  Created by Jiri Janecek on 18.06.2024.
//

import Foundation

final class PartyStore: ObservableObject {
    @Published var parties: [PartyModel] = [
        PartyModel(name: "ODS", percents: 12.9, color: .blue, isCoaliton: false),
        PartyModel(name: "ANO", percents: 33.4, color: .purple, isCoaliton: false),
        PartyModel(name: "Piráti", percents: 9.8, color: .black, isCoaliton: false)
    ]
    
    func deleteAll() {
        self.parties.removeAll()
    }
}
