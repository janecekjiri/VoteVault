//
//  DetailView.swift
//  VoteVault
//
//  Created by Jiri Janecek on 18.06.2024.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: DetailViewModel
    @State private var selectedColor = Color.blue
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                PartyNameView(partyName: self.$viewModel.model.name)
                
                // Additional spacing of 10
                Spacer()
                    .frame(height: 20)
                
                PartyColorView(selectedColor: self.$viewModel.model.color)
                
                Spacer()
                    .frame(height: 20)
                
                PartyPercentagesView(value: self.$viewModel.model.percents)
                
                Spacer()
                    .frame(height: 20)
                
                PartyCoalitionView(isOn: self.$viewModel.model.isCoaliton)
            }
        }
        .padding([.leading, .trailing, .bottom], 20)
        .toolbar {
            if self.viewModel.type == .new {
                ToolbarItem(placement: .topBarLeading) {
                    Button(
                        action: {
                            self.dismiss()
                        },
                        label: {
                            Text("cancel")
                                .foregroundStyle(Color(.label))
                    })
                }
            }
            
            ToolbarItemGroup(placement: .topBarTrailing) {
                if self.viewModel.type == .edit {
                    Button(
                        action: {},
                        label: {
                            Image(systemName: "trash")
                                .tint(Color(.label))
                    })
                }
                
                Button(
                    action: {},
                    label: {
                        Text("save")
                            .foregroundStyle(Color(.label))
                })
            }
        }
        .navigationTitle("detail_title")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel(model: nil))
}
