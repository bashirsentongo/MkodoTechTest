//
//  LotteryDrawView.swift
//  MkodoTechTest
//
//  Created by Bashir Sentongo on 21/08/2024.
//

import SwiftUI

struct LotteryDrawView: View {

    let draw: Draw

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                InfoView(Constants.drawDateTitle, with: .headline)
                InfoView(draw.drawDate)
            }

            HStack {
                InfoView(Constants.topPrizeTitle, with: .headline)
                InfoView(draw.topPrize.formatted())
            }
        }
        .padding()
    }
}

extension LotteryDrawView {

    private struct Constants {
        static let drawDateTitle = "Draw Date:"
        static let topPrizeTitle = "Top Prize:"
    }
}
