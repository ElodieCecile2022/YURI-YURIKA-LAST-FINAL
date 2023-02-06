//
//  NumberPadView.swift
//  yuriyurika
//
//  Created by Elodie Iparraguirre on 18/01/23.
//

import SwiftUI

// This view is the calculator pad
struct NumberPadView: View {
    @EnvironmentObject var yuriYurikaVM: YuriYurikaViewModel
    private let keypadTouches = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "C", "D"]
    private let grid = [GridItem](repeating: GridItem(.fixed(80), spacing: 0), count: 3)
    @Binding var entry: String
    @Binding var index: Int
    var body: some View {
        VStack(spacing: 0) {
            LazyVGrid(columns: grid, spacing: 0) {
                ForEach(keypadTouches, id: \.self) { touch in
                    NumberTouchView(entry: $entry, touch: touch, index: index)
                }
            }
        }
        .padding()
    }
}

struct NumberPadView_Previews: PreviewProvider {
    static var previews: some View {
        NumberPadView(entry: .constant(""), index: .constant(0))
    }
}
