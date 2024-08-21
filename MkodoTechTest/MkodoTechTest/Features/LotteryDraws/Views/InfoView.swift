//
//  InfoView.swift
//  MkodoTechTest
//
//  Created by Bashir Sentongo on 21/08/2024.
//

import SwiftUI

// Custom view to help us reuse Text
struct InfoView: View {

    let text: String
    let font: Font

    init(_ text: String, with font: Font = .subheadline) {
        self.text = text
        self.font = font
    }

    var body: some View {
        Text(text)
            .font(font)
    }
}
