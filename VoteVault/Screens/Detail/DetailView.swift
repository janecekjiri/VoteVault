//
//  DetailView.swift
//  VoteVault
//
//  Created by Jiri Janecek on 18.06.2024.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var partyStore: PartyStore
    @ObservedObject var viewModel: DetailViewModel
    
    @State private var selectedColor = Color.blue
    @State private var isAlertVisible = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                PartyNameView(partyName: self.$viewModel.model.name)
                
                PartyColorView(selectedColor: self.$viewModel.model.color)
                
                PartyPercentagesView(value: self.$viewModel.model.percents)
                
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
                    .accessibilityHint("detail_cancel_button_hint")
                }
            }
            
            ToolbarItemGroup(placement: .topBarTrailing) {
                if self.viewModel.type == .edit {
                    Button(
                        action: {
                            self.isAlertVisible = true
                        },
                        label: {
                            Image(systemName: "trash")
                                .tint(Color(.label))
                    })
                    .accessibilityLabel("detail_trash_label")
                    .accessibilityHint("detail_trash_hint")
                }
                
                Button(
                    action: {
                        self.partyStore.addParty(self.viewModel.model)
                        self.dismiss()
                    },
                    label: {
                        Text("save")
                            .foregroundStyle(self.viewModel.isSaveButtonEnabled ? Color(.label) : Color(.systemGray4))
                })
                .disabled(!self.viewModel.isSaveButtonEnabled)
            }
        }
        .alert(
            "detail_delete_alert_title",
            isPresented: self.$isAlertVisible,
            actions: {
                Button(
                    action: {
                        self.isAlertVisible = false
                    },
                    label: {
                        Text("no")
                    }
                )
                
                Button(
                    action: {
                        self.isAlertVisible = false
                        self.partyStore.removeParty(self.viewModel.model)
                        self.dismiss()
                    },
                    label: {
                        Text("yes")
                    }
                )
            },
            message: {
                Text("detail_delete_alert_message")
            }
        )
        .navigationTitle(self.viewModel.type == .new ? "detail_new_title" : "detail_edit_title")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel(model: nil)).environmentObject(PartyStore())
}
