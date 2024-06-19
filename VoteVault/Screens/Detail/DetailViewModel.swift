//
//  DetailViewModel.swift
//  VoteVault
//
//  Created by Jiri Janecek on 18.06.2024.
//

import Foundation

enum DetailType {
    /// Vytváříme novou stranu
    case new
    /// Upravujeme již existující stranu
    case edit
}

final class DetailViewModel: ObservableObject {
    // MARK: - Properties
    
    let type: DetailType
    @Published var model: PartyModel
    
    // MARK: - Init
    
    init(model: PartyModel?) {
        self.model = model ?? PartyModel()
        self.type = model == nil ? .new : .edit
    }
}
