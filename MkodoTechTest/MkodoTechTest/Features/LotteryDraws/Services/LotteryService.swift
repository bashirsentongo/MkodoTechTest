//
//  LotteryService.swift
//  MkodoTechTest
//
//  Created by Bashir Sentongo on 21/08/2024.
//

import Foundation

protocol LotteryServiceProtocol {
    func fetchLotteryDraws(from file: File) throws -> [Draw]
}

class LotteryService: LotteryServiceProtocol {

    // Use a file parameter to enable us test the empty scenario
    func fetchLotteryDraws(from file: File) throws -> [Draw] {
        guard let file = Bundle.main.url(
            forResource: file.name,
            withExtension: file.type
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
