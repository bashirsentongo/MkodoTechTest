//
//  LotteryDrawDetailView.swift
//  MkodoTechTest
//
//  Created by Bashir Sentongo on 21/08/2024.
//

import SwiftUI

import SwiftUI

struct LotteryDrawDetailView: View {
    let draw: Draw

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: Constants.spacing) {

                HStack {
                    InfoView(Constants.Strings.numberTitle, with: .subheadline)

                    HStack {
                        Text(draw.number1)
                        Text(draw.number2)
                        Text(draw.number3)
                        Text(draw.number4)
                        Text(draw.number5)
                        Text(draw.number6)
                    }
                    .font(.system(size: Constants.Fonts.size, weight: .regular, design: .none))
                }

                InfoView("\(Constants.Strings.bonusBallTitle) \(draw.bonusBall)")

                Spacer()
            }
            .padding()

            Spacer()
        }
        .padding(.horizontal, Constants.padding)
        .navigationTitle(Constants.Strings.navTitle)
    }
}

extension LotteryDrawDetailView {

    private struct Constants {
        static let spacing: CGFloat = 16
        static let padding: CGFloat = 16

        struct Fonts {
            static let size: CGFloat = 15
        }

        struct Strings {
            static let drawDateTitle = "Draw Date:"
            static let numberTitle = "Numbers:"
            static let bonusBallTitle = "Bonus Ball:"
            static let topPrizeTitle = "Top Prize:"
            static let navTitle = "Lottery Draw Details"
        }
    }
}
