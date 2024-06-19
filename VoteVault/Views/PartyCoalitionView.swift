//
//  PartyCoalitionView.swift
//  VoteVault
//
//  Created by Jiri Janecek on 19.06.2024.
//

import SwiftUI

struct PartyCoalitionView: View {
    @Binding var isOn: Bool
    var body: some View {
        VStack {
            HStack {
                Toggle(isOn: self.$isOn, label: {
                    Text("coalition_title")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                })
                
                // For some reason, without this code the toggle will be partially outside of the bounds
                Spacer()
                    .frame(width: 2)
            }
            
            Spacer()
                .frame(height: 5)
            
            HStack {
                Text("coalition_description")
                    .font(.footnote)
                
                Spacer()
            }
        }
    }
}

#Preview {
    PartyCoalitionView(isOn: .constant(true))
}
