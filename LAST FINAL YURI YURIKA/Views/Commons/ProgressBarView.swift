//
//  ProgressBarView.swift
//  yuriyurika
//
//  Created by Elodie Iparraguirre on 19/01/23.
//

import SwiftUI

// This view is a progress bar.
// Like health bar in video games, the content inside the rectangle will change depending on the value.
struct ProgressBarView: View {
    var progressColor: Color
    @Binding var value: Double
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.05)
                .opacity(0.3)
                .foregroundColor(.orange)
            Rectangle()
                .frame(
                    width: min(CGFloat(self.value)
                               * UIScreen.main.bounds.width * 0.6, UIScreen.main.bounds.width * 0.6),
                    height: UIScreen.main.bounds.height * 0.05)
                .foregroundColor(progressColor)
                .animation(.linear, value: value)
        }
        .cornerRadius(10)
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(progressColor: .red, value: .constant(0))
    }
}
