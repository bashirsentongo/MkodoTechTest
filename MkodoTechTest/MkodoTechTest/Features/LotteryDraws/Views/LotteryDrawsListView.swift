//
//  LotteryDrawList.swift
//  MkodoTechTest
//
//  Created by Bashir Sentongo on 21/08/2024.
//

import SwiftUI

struct LotteryDrawsListView: View {

    @ObservedObject var viewModel: LotteryDrawsViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                Background()

                if viewModel.isLoading {
                    ProgressView()
                } else {
                    List(viewModel.lotteryDraws) { draw in
                        NavigationLink(destination: LotteryDrawDetailView(draw: draw)) {
                            LotteryDrawView(draw: draw)
                        }
                    }
                }
            }
            .navigationTitle(Constants.navTitle)
            .onAppear { viewModel.fetchLotteryDraws() }
            .alert(isPresented: $viewModel.hasError, error: viewModel.error) { }
        }
    }
}

extension LotteryDrawsListView {
    private struct Constants {
        static let navTitle = "Lottery Draws"
    }
}
