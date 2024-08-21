//
//  LotteryServiceMock.swift
//  MkodoTechTestTests
//
//  Created by Bashir Sentongo on 21/08/2024.
//

import XCTest
@testable import MkodoTechTest


class LotteryServiceMock: LotteryServiceProtocol {

    var draws: [Draw] = []
    var shouldThrowError: LotteryDrawError?

    func fetchLotteryDraws(from file: File) throws -> [Draw] {
        if let error = shouldThrowError {
            throw error
        } else {
            return draws
        }
    }
}
