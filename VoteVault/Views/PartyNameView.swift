//
//  PartyNameView.swift
//  VoteVault
//
//  Created by Jiri Janecek on 19.06.2024.
//

import SwiftUI

struct PartyNameView: View {
    @Binding var partyName: String
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("party_name_title")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
            }
            
            Spacer()
                .frame(height: 10)
            
            TextField("party_name_placeholder", text: self.$partyName)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.vertical, 12)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundStyle(Color(.systemGray6))
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 1)
                }
        }
    }
}

#Preview {
    PartyNameView(partyName: .constant("ODS"))
}
