//
//  CalculView.swift
//  yuriyurika
//
//  Created by Elodie Iparraguirre on 18/01/23.
//

import SwiftUI

// This view is the calcul view of a lesson.
struct CalculView: View {
    @EnvironmentObject var yuriYurikaVM: YuriYurikaViewModel
    @State private var entry: String = ""
    @Binding var isShowingLesson: Bool
    @Binding var index: Int
    @State private var ddd: String?
    @State private var kmk: String?
    @State private var isShowingAnswerPopUp: Bool = false
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
//
                if let url = yuriYurikaVM.superHeros.first?.image.url {
                    if let lessonName = yuriYurikaVM.lessons[index].name {
                        Text(lessonName.uppercased())
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                    }
                    LessonTopContentView(url: url, index: index)
// HStack {
//                            .fontWeight(.bold)
//                            .font(.title2)
//                        ProgressBarView(value: $yuriYurikaVM.lessons[index].currentProgress)
//                            .padding()
//                    }
                    CalculatorView(entry: $entry, index: $index)
                    ActionButtonView(label: "Check", backgroundColor: Color.blue) {
                        print("Check pressed")
                        yuriYurikaVM.checkCurrentCalcul(index, entry: &entry)
                    }
                    .padding()
                    ActionButtonView(label: "Quit", backgroundColor: Color.primary) {
                        isShowingLesson.toggle()
                    }
                    .padding()
                }
            }
            AnswerView(index: index, entry: $entry)
        }
    }
}

struct CalculView_Previews: PreviewProvider {
    static var previews: some View {
        CalculView(isShowingLesson: .constant(false), index: .constant(0))
            .environmentObject(YuriYurikaViewModel())
    }
}
