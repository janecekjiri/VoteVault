//
//  PartyColorView.swift
//  VoteVault
//
//  Created by Jiri Janecek on 19.06.2024.
//

import SwiftUI

struct PartyColorView: View {
    @Binding var selectedColor: Color
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("party_color_title")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
            }
            
            Spacer()
                .frame(height: 10)
            
            ColorPicker(selection: self.$selectedColor, supportsOpacity: false, label: {
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 50)
                    .foregroundStyle(self.selectedColor)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black, lineWidth: 1)
                    }
            })
            
            Spacer()
                .frame(height: 5)
            
            HStack {
                Text("tap_on_button_to_open_color_picker")
                    .font(.footnote)
                
                Spacer()
            }
        }
    }
}

#Preview {
    PartyColorView(selectedColor: .constant(.red))
}
