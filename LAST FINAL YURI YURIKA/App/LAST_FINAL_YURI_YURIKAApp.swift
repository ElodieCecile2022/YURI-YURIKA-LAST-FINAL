//
//  LAST_FINAL_YURI_YURIKAApp.swift
//  LAST FINAL YURI YURIKA
//
//  Created by Elodie Iparraguirre on 06/02/23.
//

import SwiftUI

@main
struct LAST_FINAL_YURI_YURIKAApp: App {
    @StateObject var vme = YuriYurikaViewModel.shared
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .onAppear {
                    Task {
                        vme.superHeros = try await vme.fetchSuperHeros()
                    }
                }
                .environmentObject(vme)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
