//
//  ResultsView.swift
//  VoteVault
//
//  Created by Jiri Janecek on 23.06.2024.
//

import Charts
import SwiftUI

struct ResultsView: View {
    @EnvironmentObject var partyStore: PartyStore
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = ResultsViewModel()
    
    var body: some View {
        Chart {
            ForEach(self.viewModel.finalParties, id: \.name) { party in
                BarMark(x: .value("chart_party_label", party.name), y: .value("chart_mandates_label", party.mandates))
                    .foregroundStyle(party.color)
                    .annotation {
                        Text(verbatim: "\(party.mandates)")
                    }
            }
        }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("results_title")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(
                        action: {
                            self.dismiss()
                        },
                        label: {
                            Image(systemName: "xmark")
                                .foregroundStyle(Color(.label))
                    })
                }
            }
            .onAppear {
                self.viewModel.parties = self.partyStore.parties
            }
    }
}

#Preview {
    NavigationStack {
        ResultsView().environmentObject(PartyStore())
    }
}
