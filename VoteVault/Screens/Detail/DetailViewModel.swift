//
//  DetailViewModel.swift
//  VoteVault
//
//  Created by Jiri Janecek on 18.06.2024.
//

import Foundation

final class DetailViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var model: PartyModel
    
    // MARK: - Init
    
    init(model: PartyModel?) {
        self.model = model ?? PartyModel()
    }
}
