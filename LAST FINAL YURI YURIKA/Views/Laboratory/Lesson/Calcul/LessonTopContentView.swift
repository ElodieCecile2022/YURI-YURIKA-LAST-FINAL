//
//  LessonTopContentView.swift
//  yuriyurika
//
//  Created by Elodie Iparraguirre on 19/01/23.
//

import SwiftUI

// This view is the top content of the CalculView.
struct LessonTopContentView: View {
    @EnvironmentObject var yuriYurikaVM: YuriYurikaViewModel
    var url: String?
    var index: Int
    var body: some View {
        VStack(spacing: 0) {
            if let image = yuriYurikaVM.lessons[yuriYurikaVM.currentLessonIndex].image {
                FetchedImageView(url: image)
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding()
            }
            VStack {
                if let lessonCategory = yuriYurikaVM.lessons[index].category {
                    Text("Can you tap the result of this \(lessonCategory) on the calculator ?")
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .padding(.horizontal)
                }
                Text("\(yuriYurikaVM.calcul.generatedCalcul)")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
            }
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct LessonTopContentView_Previews: PreviewProvider {
    static var previews: some View {
        LessonTopContentView(index: 0)
    }
}
