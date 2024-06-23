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
    @State private var isExplanationVisible = false
    
    var body: some View {
        Chart {
            ForEach(self.viewModel.finalParties, id: \.name) { party in
                BarMark(x: .value("chart_party_label", party.name), y: .value("chart_seats_label", party.seats))
                    .foregroundStyle(party.color)
                    .annotation {
                        Text(verbatim: "\(party.seats)")
                            .foregroundStyle(Color(.label))
                    }
            }
        }
        .safeAreaInset(edge: .bottom, content: {
            Button(
                action: {
                    self.isExplanationVisible = true
                },
                label: {
                    HStack {
                        Text("results_explanation_button")
                        Image(systemName: "arrow.right.circle")
                    }
                    .foregroundStyle(Color(.label))
                    .accessibilityElement()
                    .accessibilityLabel("results_explanation_button")
                    .accessibilityAddTraits(.isButton)
                    .accessibilityHint("results_explanation_button_hint")
            })
            .frame(height: 50)
        })
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
        .fullScreenCover(
            isPresented: self.$isExplanationVisible,
            onDismiss: {
                self.isExplanationVisible = false
            },
            content: {
                NavigationStack {
                    ExplanationView()
                }
        })
    }
}

#Preview {
    NavigationStack {
        ResultsView().environmentObject(PartyStore())
    }
}
