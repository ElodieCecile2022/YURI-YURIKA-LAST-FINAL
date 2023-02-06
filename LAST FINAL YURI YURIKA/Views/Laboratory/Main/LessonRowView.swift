//
//  LessonRowView.swift
//  yuriyurika
//
//  Created by Elodie Iparraguirre on 19/01/23.
//

import SwiftUI

// This view is the reusable row of the lesson list
struct LessonRowView: View {
    @EnvironmentObject var yuriYurikaVM: YuriYurikaViewModel
    var index: Int
    @Binding var isShowingLesson: Bool
    var body: some View {
        Button {
            yuriYurikaVM.currentLessonIndex = index
            yuriYurikaVM.generateNewCalcul(index)
//            let axe : [String] = []
//            YuriYurikaRandomSt.YuriRM.arrOfLessons = ax
//            YuriYurikaRandomSt.YuriRM.idxOfLesson = 0
            isShowingLesson.toggle()
        } label: {
            VStack(spacing: 0) {
                if let lessonName = yuriYurikaVM.lessons[index].name {
                    Text(lessonName.uppercased())
                        .font(.system(size: 25, weight: .semibold, design: .rounded))
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                }
                FetchedImageView(url: yuriYurikaVM.lessons[index].image)
                    .scaledToFit()
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 0, x: 5, y: 5)
                    .padding(.horizontal)
                    .overlay(
                        ZStack {
                            if !yuriYurikaVM.lessons[index].isUnlocked {
                                Color.black
                                    .opacity(0.7)
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                            }
                        }
                    )
            }
        }
        .disabled(!yuriYurikaVM.lessons[index].isUnlocked)
    }
}

struct LessonRowView_Previews: PreviewProvider {
    static var previews: some View {
        LessonRowView(index: 0, isShowingLesson: .constant(false))
    }
}
