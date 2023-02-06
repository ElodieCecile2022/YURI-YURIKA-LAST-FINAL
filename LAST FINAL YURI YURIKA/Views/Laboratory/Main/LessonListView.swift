//
//  LessonListView.swift
//  yuriyurika
//
//  Created by Elodie Iparraguirre on 18/01/23.
//

import SwiftUI

// This view is the list of the lessons for the LaboratoryView.
struct LessonListView: View {
    @EnvironmentObject var yuriYurikaVM: YuriYurikaViewModel
    @Binding var isShowingLesson: Bool
    var body: some View {
        VStack {
            ScrollView {
                ForEach(yuriYurikaVM.lessons.indices, id: \.self) { index in
                    LessonRowView(index: index, isShowingLesson: $isShowingLesson)
                }
            }
        }
    }
}

struct LessonListView_Previews: PreviewProvider {
    static var previews: some View {
        LessonListView(isShowingLesson: .constant(false))
            .environmentObject(YuriYurikaViewModel())
    }
}
