//
//  PartyPercentagesView.swift
//  VoteVault
//
//  Created by Jiri Janecek on 19.06.2024.
//

import SwiftUI

struct PartyPercentagesView: View {
    @Binding var value: Double?
    var body: some View {
        VStack {
            HStack {
                Text("percentages_title")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .accessibilityRemoveTraits(.isStaticText)
                    .accessibilityAddTraits(.isHeader)
                
                Spacer()
            }
            
            Spacer()
                .frame(height: 10)
            
            TextField("percentages_placeholder", value: self.$value, format: .number)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.vertical, 12)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundStyle(Color(.systemGray6))
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.label), lineWidth: 1)
                }
                .accessibilityLabel("percentages_label")
        }
    }
}

#Preview {
    @State var value: Double?
    return PartyPercentagesView(value: $value)
}
