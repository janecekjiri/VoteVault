//
//  ExplanationView.swift
//  VoteVault
//
//  Created by Jiri Janecek on 23.06.2024.
//

import SwiftUI

struct ExplanationView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            Text("explanation_text")
                .font(.headline)
                .foregroundStyle(Color(.label))
                .padding(.horizontal, 20)
        }
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
    }
}

#Preview {
    NavigationStack {
        ExplanationView()
    }
}
