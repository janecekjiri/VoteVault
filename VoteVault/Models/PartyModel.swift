//
//  PartyModel.swift
//  VoteVault
//
//  Created by Jiri Janecek on 18.06.2024.
//

import Foundation
import SwiftUI

final class PartyModel: ObservableObject, Hashable {
    static func == (lhs: PartyModel, rhs: PartyModel) -> Bool {
        return lhs.name == rhs.name
    }
    
    @Published var name: String
    @Published var percents: Double
    @Published var color = Color.blue
    @Published var isCoaliton = false
    
    var formattedPercentsValue: String {
        return self.percents.formatted(.number.precision(.fractionLength(0...1)))
    }
    
    init(name: String = "", percents: Double = 0.0, color: Color = .blue, isCoaliton: Bool = false) {
        self.name = name
        self.percents = percents
        self.color = color
        self.isCoaliton = isCoaliton
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
        hasher.combine(self.percents)
        hasher.combine(self.color)
        hasher.combine(self.isCoaliton)
    }
}
