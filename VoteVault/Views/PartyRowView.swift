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
        GeometryReader { geometry in
            HStack {
                Text(self.model.name ?? "")
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
                .frame(width: geometry.size.width * 0.25)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            // note: takto udělané pozadí? smart! :)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .foregroundStyle(Color(.systemGray6))
            )
        }
    }
    
    init(model: PartyModel) {
        self.model = model
    }
}

#Preview {
    PartyRowView(model: PartyModel(name: "ODS", percents: 15.7, color: .black, isCoaliton: false))
}
