//
//  PartyRowView.swift
//  VoteVault
//
//  Created by Jiri Janecek on 18.06.2024.
//

import SwiftUI

struct PartyRowView: View {
    @ObservedObject private var model: PartyModel
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Text(self.model.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer(minLength: 10)
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 30, height: 30)
                    .foregroundStyle(self.model.color)
                
                HStack {
                    Spacer()
                    
                    Text(verbatim: "\(self.model.formattedPercentsValue)%")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .frame(width: geometry.size.width * 0.3)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .foregroundStyle(Color(.systemGray6))
            )
            .accessibilityElement()
            .accessibilityAddTraits(.isButton)
            .accessibilityValue("\(self.model.name) \(self.model.formattedPercentsValue) party_row_value")
            .accessibilityHint("party_row_hint")
        }
    }
    
    init(model: PartyModel) {
        self.model = model
    }
}

#Preview {
    List {
        PartyRowView(model: PartyModel(name: "ABC", percents: 69.69, color: .blue, isCoaliton: false))
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listSectionSeparator(.hidden)
    }
    .listStyle(.plain)
    .padding(.horizontal, 20)
}
