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
                    Text("Přidejte nové politické strany tapnutím na tlačítko + v pravém horním rohu.")
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
                    
                    VStack {
                        Spacer()
                        
                        Button(
                            action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                            label: {
                                Text("Vyhodnotit")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                    .padding(.vertical, 12)
                                    .frame(maxWidth: .infinity)
                                    .background(.blue)
                                    .clipShape(.capsule)
                                // note: měl jsem zřejmě špatné pořadí modifikátorů
                        })
                    }
                }
            }
            .padding(20)
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
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(
                        action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                        label: {
                            Image(systemName: "plus.circle")
                    })
                }
            }
            .alert(
                "Chcete vážně smazat všechny strany?",
                isPresented: self.$isDeleteAllAlertVisible,
                actions: {
                    Button(
                        role: .cancel,
                        action: {
                            self.isDeleteAllAlertVisible = false
                        }) {
                            Text("Ne")
                        }
                    
                    Button {
                        self.partyStore.deleteAll()
                        self.isDeleteAllAlertVisible = false
                    } label: {
                        Text("Ano")
                    }

                },
                message: {
                    Text("Tato akce má nevratné následky.")
                }
            )
            .tint(Color(.label))
        }
    }
}

#Preview {
    HomeView().environmentObject(PartyStore())
}
