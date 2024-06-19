//
//  DetailViewModel.swift
//  VoteVault
//
//  Created by Jiri Janecek on 18.06.2024.
//

import Combine
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
    @Published var isSaveButtonEnabled = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    // MARK: - Init
    
    init(model: PartyModel?) {
        self.model = model ?? PartyModel()
        self.type = model == nil ? .new : .edit
        
        Publishers.CombineLatest(self.model.$name, self.model.$percents)
            .receive(on: RunLoop.main)
            .map { name, percents in
                return !name.isEmpty && percents > 0.0
            }
            .assign(to: \.isSaveButtonEnabled, on: self)
            .store(in: &cancellableSet)
    }
}
