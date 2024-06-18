//
//  HomeView.swift
//  VoteVault
//
//  Created by Jiri Janecek on 18.06.2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var partyStore: PartyStore
    
    @State private var isDeleteAllAlertVisible = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                if self.partyStore.parties.isEmpty {
                    Text("home_view_empty_message")
                        .font(.title3)
                        .fontWeight(.semibold)
                } else {
                    List(self.partyStore.parties, id: \.name) { party in
                        PartyRowView(model: party)
                            .listRowSeparator(.hidden)
                            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                    .listStyle(.plain)
                    .listRowSpacing(10)
                    .safeAreaInset(edge: .bottom) {
                        Button(
                            action: {
                                // TODO: Vyhodnotit
                            },
                            label: {
                                Text("evaluate")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(self.partyStore.isPercentageSumCorrect ? Color.white : Color(.systemGray2))
                                    .padding(.vertical, 12)
                                    .frame(maxWidth: .infinity)
                                    .background(self.partyStore.isPercentageSumCorrect ? Color.blue : Color(.systemGray6))
                                    .clipShape(.capsule)
                                // note: měl jsem zřejmě špatné pořadí modifikátorů
                        })
                        .disabled(!self.partyStore.isPercentageSumCorrect)
                        .accessibilityHint("evaluate_hint")
                    }
                }
            }
            .padding([.leading, .trailing, .bottom], 20)
            .toolbar {
                if !self.partyStore.parties.isEmpty {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(
                            action: {
                                self.isDeleteAllAlertVisible = true
                            },
                            label: {
                                Image(systemName: "trash")
                        })
                        .accessibilityElement()
                        .accessibilityValue("delete_toolbar_value")
                        .accessibilityHint("delete_toolbar_hint")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(
                        action: {
                            // TODO: Zobrazit modál k vytvoření strany
                            self.partyStore.change()
                        },
                        label: {
                            Image(systemName: "plus.circle")
                    })
                    .accessibilityElement()
                    .accessibilityValue("add_toolbar_value")
                    .accessibilityHint("add_toolbar_hint")
                }
            }
            .alert(
                "alert_delete_all_parties_title",
                isPresented: self.$isDeleteAllAlertVisible,
                actions: {
                    Button(
                        role: .cancel,
                        action: {
                            self.isDeleteAllAlertVisible = false
                        }) {
                            Text("no")
                        }
                    
                    Button {
                        self.partyStore.deleteAll()
                        self.isDeleteAllAlertVisible = false
                    } label: {
                        Text("yes")
                    }

                },
                message: {
                    Text("alert_delete_all_parties_message")
                }
            )
            .tint(Color(.label))
        }
    }
}

#Preview {
    HomeView().environmentObject(PartyStore())
}
