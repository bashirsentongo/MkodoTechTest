//
//  MkodoTechTestApp.swift
//  MkodoTechTest
//
//  Created by Bashir Sentongo on 21/08/2024.
//

import SwiftUI

@main
struct MkodoTechTestApp: App {
    var body: some Scene {
        WindowGroup {
            let service = LotteryService()
            let viewModel = LotteryDrawsViewModel(service: service)
            LotteryDrawsListView(viewModel: viewModel)
        }
    }
}
