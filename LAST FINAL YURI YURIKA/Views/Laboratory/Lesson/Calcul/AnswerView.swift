//
//  AnswerView.swift
//  Yuri Yurika FinalP
//
//  Created by Elodie Iparraguirre on 26/01/23.
//

import SwiftUI

struct AnswerView: View {
    @EnvironmentObject var yuriYurikaVM: YuriYurikaViewModel
    var index: Int
    @Binding var entry: String
    var progressColor: Color {
        switch true {
        case yuriYurikaVM.calcul.answer == .badAnswer:
            return .red
        case yuriYurikaVM.lessons[index].isDone:
            return .orange
        case yuriYurikaVM.calcul.answer == .rightAnswer:
            return .green
        default:
            return .blue
        }
    }
    var cheerSentence: String {
        switch true {
        case yuriYurikaVM.calcul.answer == .badAnswer:
            return "Don't give up !"
        case yuriYurikaVM.lessons[index].isDone:
            return "You are already a master"
        case yuriYurikaVM.calcul.answer == .rightAnswer:
            return "You become better and better"
        default:
            return "Something went wrong"
        }
    }
    var points: String {
        get_cur_points(yuriYurikaVM: yuriYurikaVM, index: index)
    }
    var body: some View {
        if yuriYurikaVM.calcul.answer != .guess {
            Color.white.ignoresSafeArea()
            VStack(spacing: 10) {
                Text("Points \(points)" + "/\(String(format: "%g", yuriYurikaVM.lessons[index].maxProgress))")
                    .fontWeight(.semibold)
                    .font(.title3)
                ProgressBarView(progressColor: progressColor, value: $yuriYurikaVM.lessons[index].currentProgress)
                    .padding()
                Text(yuriYurikaVM.calcul.answer == .rightAnswer ? "GOOD ANSWER !" : "BAD ANSWER !")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .foregroundColor(.primary)
                Text(cheerSentence)
                    .font(.subheadline)
                    .italic()
                ActionButtonView(label: yuriYurikaVM.calcul.answer == .rightAnswer ?
                                 "Next" : "Try again",
                                 backgroundColor: progressColor) {
                    yuriYurikaVM.calcul.answer = .guess
                    switch yuriYurikaVM.lessons[index].category {
                    case "addition":
                        yuriYurikaVM.calcul.generateNewAddition()
                        entry = ""
                        yuriYurikaVM.refresh.toggle()
                    default:
                        ()
                    }
                }
                                 .padding()
            }
            .onAppear {
                if yuriYurikaVM.calcul.answer == .rightAnswer {
                    yuriYurikaVM.progressInLesson()
                } else {
                    yuriYurikaVM.regressInLesson()
                }
            }
        }
    }
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView(index: 0, entry: .constant(""))
    }
}
