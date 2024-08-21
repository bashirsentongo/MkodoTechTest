//
//  LotteryDrawViewModel.swift
//  MkodoTechTest
//
//  Created by Bashir Sentongo on 21/08/2024.
//

import Foundation

class LotteryDrawsViewModel: ObservableObject {

    @Published private(set) var lotteryDraws: [Draw] = []
    @Published private var viewState: ViewState?
    @Published private(set) var error: LotteryDrawError?
    @Published var hasError = false

    private let service: LotteryServiceProtocol

    var isLoading: Bool {
        viewState == .loading
    }

    init(service: LotteryServiceProtocol) {
        self.service = service
    }

    func fetchLotteryDraws() {
        viewState = .loading
        defer { viewState = .finished  }

        do {
            let draws = try service.fetchLotteryDraws()
            lotteryDraws = draws
        } catch {
            hasError = true

            if let lotteryDrawError = error as? LotteryDrawError {
                self.error = lotteryDrawError
            } else {
                self.error = .custom(error: error)
            }
        }
    }
}

extension LotteryDrawsViewModel {
    enum ViewState {
        case loading
        case finished
    }
}
