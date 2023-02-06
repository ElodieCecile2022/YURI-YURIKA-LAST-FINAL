//
//  CalculatorView.swift
//  yuriyurika
//
//  Created by Elodie Iparraguirre on 19/01/23.
//

import SwiftUI

// This view is the calculator for the CalculView.
struct CalculatorView: View {
    @Binding var entry: String
    @Binding var index: Int
    var body: some View {
        LinearGradient(colors: [.orange, .red], startPoint: .top, endPoint: .bottom)
            .cornerRadius(10)
            .shadow(color: .black, radius: 0, x: 5, y: 5)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                VStack(spacing: 0) {
                    EntryFieldView(text: entry)
                        .padding(.top)
                    NumberPadView(entry: $entry, index: $index)
                }
            )
            .padding()
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(entry: .constant(""), index: .constant(0))
    }
}
