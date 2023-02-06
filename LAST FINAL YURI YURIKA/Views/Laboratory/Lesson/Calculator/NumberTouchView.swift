//
//  NumberTouchView.swift
//  yuriyurika
//
//  Created by Elodie Iparraguirre on 19/01/23.
//

import SwiftUI

// This view represent a reusable touch on the NumberPadView.
struct NumberTouchView: View {
    @EnvironmentObject var yuriYurikaVM: YuriYurikaViewModel
    @Binding var entry: String
    var touch: String
    var index: Int
    var body: some View {
        Button {
            yuriYurikaVM.calcul.updateEntry(entry: &entry, with: touch, index: index)
        } label: {
            ZStack {
                Color(red: 173/255, green: 80/255, blue: 48/255)
                    .cornerRadius(10)
                    .frame(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.width * 0.1)
                    .shadow(color: .black, radius: 0, x: 3, y: 3)
                Text("\(touch)")
                    .font(.system(size: 35, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
            }
        }
    }
}

struct NumberTouchView_Previews: PreviewProvider {
    static var previews: some View {
        NumberTouchView(entry: .constant(""), touch: "", index: 0)
    }
}
