//
//  PartyModel.swift
//  VoteVault
//
//  Created by Jiri Janecek on 18.06.2024.
//

import Foundation
import SwiftUI

final class PartyModel: ObservableObject {
    @Published var name: String? = nil
    @Published var percents: Double? = nil
    @Published var color = Color.blue
    @Published var isCoaliton = false
    
    init(name: String? = nil, percents: Double? = nil, color: Color = .blue, isCoaliton: Bool = false) {
        self.name = name
        self.percents = percents
        self.color = color
        self.isCoaliton = isCoaliton
    }
}
