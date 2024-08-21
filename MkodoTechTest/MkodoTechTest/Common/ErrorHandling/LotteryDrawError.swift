//
//  LotteryDrawError.swift
//  MkodoTechTest
//
//  Created by Bashir Sentongo on 21/08/2024.
//

import Foundation

enum LotteryDrawError: LocalizedError, Equatable {
    case noDataFound
    case noFiledFound
    case custom(error: Error)

    var description: String {
        switch self {
        case .noFiledFound:
            return "Json file not found"
        case .noDataFound:
            return "No Lottery draws found"
        case .custom(let error):
            return "Something went wrong \(error.localizedDescription)"
        }
    }

    static func == (lhs: LotteryDrawError, rhs: LotteryDrawError) -> Bool {
        switch (lhs, rhs) {
        case (.noDataFound, .noDataFound):
            return true
        case (.noFiledFound, .noFiledFound):
            return true
        case (.custom(let lhsError), .custom(let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        default:
            return false
        }
    }
}
