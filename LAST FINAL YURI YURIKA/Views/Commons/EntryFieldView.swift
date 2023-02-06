//
//  EntryFieldView.swift
//  yuriyurika
//
//  Created by Elodie Iparraguirre on 18/01/23.
//

import SwiftUI

// This view is the rectangle entry of the calculator.
struct EntryFieldView: View {
    var text: String
    var body: some View {
        Text(text)
            .fontWeight(.bold)
            .font(.title2)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(
                Color.white
                    .cornerRadius(10)
                    .padding(.horizontal)
            )
    }
}

struct EntryFieldView_Previews: PreviewProvider {
    static var previews: some View {
        EntryFieldView(text: "")
    }
}
