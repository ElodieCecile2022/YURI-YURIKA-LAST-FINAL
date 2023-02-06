//
//  ActionButtonView.swift
//  yuriyurika
//
//  Created by Elodie Iparraguirre on 18/01/23.
//

import SwiftUI

// A common reusable button for the app.
struct ActionButtonView: View {
    var label: String
    var backgroundColor: Color
    var action: (() -> Void)?
    var body: some View {
        Button {
            withAnimation { action?() }
        } label: {
            Text(label)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: 360, maxHeight: 50)
                .background(
                    backgroundColor
                        .cornerRadius(10)
                        .shadow(color: .secondary, radius: 0, x: 3, y: 3)
                        .padding(.horizontal)
                )
        }
        .buttonStyle(PressButtonModifier())
    }
}

struct ActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonView(label: "Action Button", backgroundColor: Color.primary)
    }
}
