//
//  HomeView.swift
//  VoteVault
//
//  Created by Jiri Janecek on 18.06.2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var partyStore: PartyStore
    var body: some View {
        NavigationStack {
            ZStack {
                if self.partyStore.parties.isEmpty {
                    Text("Přidejte nové politické strany tapnutím na tlačítko + v pravém horním rohu.")
                        .font(.title3)
                        .fontWeight(.semibold)
                } else {
                    List(self.partyStore.parties, id: \.name) { party in
                        PartyRowView()
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
                            action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
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
            .tint(Color(.label))
        }
    }
}

#Preview {
    HomeView().environmentObject(PartyStore())
}

private struct PartyRowView: View {
    var body: some View {
        HStack {
            Text("ODS")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer(minLength: 10)
            
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 30, height: 30)
                .foregroundStyle(.blue)
            
            Spacer()
                .frame(width: 10)
            
            Text("15,6%")
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.trailing)
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
