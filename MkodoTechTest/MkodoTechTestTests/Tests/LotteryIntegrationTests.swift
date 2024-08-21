//
//  LotteryIntegrationTests.swift
//  MkodoTechTestTests
//
//  Created by Bashir Sentongo on 21/08/2024.
//

import XCTest
@testable import MkodoTechTest

class LotteryIntegrationTests: XCTestCase {

    func testViewModelFetchesDrawsSuccessfully() {
        // Given
        let service = LotteryService()
        let viewModel = LotteryDrawsViewModel(service: service)

        // When
        viewModel.fetchLotteryDraws()

        // Then
        XCTAssertFalse(viewModel.hasError, "hasError should be false")
        XCTAssertTrue(viewModel.lotteryDraws.isNotEmpty, "Lottery draws should not be empty")
        XCTAssertNil(viewModel.error, "Error should be nil")
        XCTAssertEqual(viewModel.lotteryDraws.count, 3) // Replace expectedCount with the actual number of draws
    }

    func testViewModelHandlesMissingFile() {
        // Given
        let service = LotteryService()
        let viewModel = LotteryDrawsViewModel(service: service)

        // Use a configuration or method that forces the use of a non-existent file
        viewModel.fetchLotteryDraws(from: File(name: "nonExistentFile"))

        // Then
        XCTAssertTrue(viewModel.hasError, "hasError should be true")
        XCTAssertEqual(viewModel.error, .noFiledFound, "Error should be noFiledFound")
        XCTAssertTrue(viewModel.lotteryDraws.isEmpty, "Lottery draws should be empty")
    }

    func testViewModelHandlesEmptyData() {
        // Given
        let service = LotteryService()
        let viewModel = LotteryDrawsViewModel(service: service)

        // Use a configuration or method that forces the use of an empty file
        viewModel.fetchLotteryDraws(from: File(name: "mockEmptyLotteryDraws"))

        // Then
        XCTAssertTrue(viewModel.hasError, "hasError should be true")
        XCTAssertTrue(viewModel.lotteryDraws.isEmpty, "Lottery draws should be empty")
    }
}
