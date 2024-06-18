//
//  PartyRowView.swift
//  VoteVault
//
//  Created by Jiri Janecek on 18.06.2024.
//

import SwiftUI

struct PartyRowView: View {
    private let model: PartyModel
    
    var body: some View {
        HStack {
            Text(self.model.name ?? "")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer(minLength: 10)
            
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 30, height: 30)
                .foregroundStyle(self.model.color)
            
            Spacer()
                .frame(width: 10)
            
            Text(verbatim: "\(self.model.formattedPercentsValue)%")
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.trailing)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        // note: takto udělané pozadí? smart! :)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(Color(.systemGray6))
        )
    }
    
    init(model: PartyModel) {
        self.model = model
    }
}
