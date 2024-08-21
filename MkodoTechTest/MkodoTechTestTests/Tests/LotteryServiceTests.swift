//
//  LotteryServiceTests.swift
//  MkodoTechTestTests
//
//  Created by Bashir Sentongo on 21/08/2024.
//

import XCTest
@testable import MkodoTechTest 

class LotteryServiceTests: XCTestCase {

    var service: LotteryService!

    override func setUpWithError() throws {
        service = LotteryService()
    }

    override func tearDownWithError() throws {
        service = nil
    }

    // Test for successful data fetching, Use a mock JSON file that has valid data
    func test_fetch_lottery_draws_success() throws {
        // Given
        guard let fileURL = Bundle(for: type(of: self)).url(forResource: "mockLotteryDraws", withExtension: "json") else {
            XCTFail("File not found")
            return
        }

        // When
        let data = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()

        let lotteryResponse = try decoder.decode(LotteryDraw.self, from: data)

        // Then
        XCTAssertEqual(lotteryResponse.draws.count, 3, "Expected 3 lottery draws in the response")
    }

    // Test that file is missing
    func test_fetch_lottery_draws_file_notFound() {
        // Given
        let service = LotteryService()

        // When & Then
        XCTAssertThrowsError(try service.fetchLotteryDraws(from: File(name: "mockData")), "Expected noFiledFound error") { error in
            XCTAssertEqual(error as? LotteryDrawError, LotteryDrawError.noFiledFound)
        }
    }

    // Test scenario where data might be empty
    func test_fetch_lottery_draws_noData() {
        // Given
        guard let fileURL = Bundle(for: type(of: self)).url(forResource: "mockEmptyLotteryDraws", withExtension: "json") else {
            XCTFail("File not found")
            return
        }

        // When
        let data = try! Data(contentsOf: fileURL)
        let decoder = JSONDecoder()

        do {
            _ = try decoder.decode(LotteryDraw.self, from: data)
        } catch {
            XCTAssertEqual(error as? LotteryDrawError, LotteryDrawError.noDataFound)
        }
    }
}
