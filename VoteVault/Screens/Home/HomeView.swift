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
    @State private var isDetailViewVisible = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                if self.partyStore.parties.isEmpty {
                    Text("home_view_empty_message")
                        .font(.title3)
                        .fontWeight(.semibold)
                } else {
                    List(self.partyStore.parties, id: \.name) { party in
                        ZStack {
                            PartyRowView(model: party)
                            
                            NavigationLink(value: party) {
                                EmptyView()
                            }
                            .opacity(0)
                        }
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
                    .navigationDestination(for: PartyModel.self) { party in
                        DetailView(viewModel: DetailViewModel(model: party)).environmentObject(self.partyStore)
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
                                    .tint(Color(.label))
                        })
                        .accessibilityElement()
                        .accessibilityValue("delete_toolbar_value")
                        .accessibilityHint("delete_toolbar_hint")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(
                        action: {
                            self.isDetailViewVisible = true
                        },
                        label: {
                            Image(systemName: "plus.circle")
                                .tint(Color(.label))
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
            .sheet(
                isPresented: self.$isDetailViewVisible,
                onDismiss: {
                    self.isDetailViewVisible = false
                },
                content: {
                    NavigationStack {
                        DetailView(viewModel: DetailViewModel(model: nil)).environmentObject(self.partyStore)
                    }
            })
        }
    }
}

#Preview {
    HomeView().environmentObject(PartyStore())
}
