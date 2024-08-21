//
//  LotteryDrawsViewModelTests.swift
//  MkodoTechTestTests
//
//  Created by Bashir Sentongo on 21/08/2024.
//

import XCTest
@testable import MkodoTechTest

class LotteryDrawsViewModelTests: XCTestCase {

    var mockService: LotteryServiceMock!
    var viewModel: LotteryDrawsViewModel!

    override func setUpWithError() throws {
        mockService = LotteryServiceMock()
        viewModel = LotteryDrawsViewModel(service: mockService)
    }

    override func tearDownWithError() throws {
        mockService = nil
        viewModel = nil
    }

    func test_fetch_lottery_draws_success() {
        // Given
        let expectedDraws = [
            Draw(id: "draw-1", drawDate: "2023-05-15", number1: "2", number2: "16", number3: "23", number4: "44", number5: "47", number6: "52", bonusBall: "14", topPrize: 4000000000),
            Draw(id: "draw-2", drawDate: "2023-05-22", number1: "5", number2: "45", number3: "51", number4: "32", number5: "24", number6: "18", bonusBall: "28", topPrize: 6000000000)
        ]
        mockService.draws = expectedDraws

        // When
        viewModel.fetchLotteryDraws()

        // Then
        XCTAssertFalse(viewModel.hasError)
        XCTAssertTrue(viewModel.lotteryDraws.isNotEmpty)
        XCTAssertEqual(viewModel.lotteryDraws.count, 2)
        XCTAssertEqual(viewModel.lotteryDraws.last?.id, "draw-2")
    }

    func test_fetch_lottery_draws_ailure() {
        // Given
        mockService.shouldThrowError = .noDataFound

        // When
        viewModel.fetchLotteryDraws()

        // Then
        XCTAssertTrue(viewModel.hasError)
        XCTAssertEqual(viewModel.error, LotteryDrawError.noDataFound)
        XCTAssertTrue(viewModel.lotteryDraws.isEmpty)
    }

    func test_viewModel_has_finished_loading() {
        // Given
        mockService.draws = []

        // When
        viewModel.fetchLotteryDraws()

        // Then
        XCTAssertFalse(viewModel.isLoading)
    }
}
