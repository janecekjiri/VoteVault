//
//  VoteVaultApp.swift
//  VoteVault
//
//  Created by Jiri Janecek on 18.06.2024.
//

import SwiftUI

@main
struct VoteVaultApp: App {
    @ObservedObject var partyStore = PartyStore()
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(self.partyStore)
        }
    }
}
