//
//  LotteryService.swift
//  MkodoTechTest
//
//  Created by Bashir Sentongo on 21/08/2024.
//

import Foundation

protocol LotteryServiceProtocol {
    func fetchLotteryDraws() throws -> [Draw]
}

class LotteryService: LotteryServiceProtocol {

    func fetchLotteryDraws() throws -> [Draw] {
        guard let file = Bundle.main.url(
            forResource: Constants.resource,
            withExtension: Constants.type
        ) else {
            throw LotteryDrawError.noFiledFound
        }

        let data = try Data(contentsOf: file)
        let decoder = JSONDecoder()

        let lotteryResponse = try decoder.decode(LotteryDraw.self, from: data)

        guard lotteryResponse.draws.isNotEmpty else {
            throw LotteryDrawError.noDataFound
        }

        return lotteryResponse.draws
    }
}

extension LotteryService {

    private struct Constants {
        static let resource = "lotteryDraws"
        static let type = "json"
    }
}
