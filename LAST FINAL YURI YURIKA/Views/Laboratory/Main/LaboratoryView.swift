//
//  LaboratoryView.swift
//  yuriyurika
//
//  Created by Elodie Iparraguirre on 18/01/23.
//

import SwiftUI

// This view is the entire view of the Laboratory
struct LaboratoryView: View {
    @EnvironmentObject var yuriYurikaVM: YuriYurikaViewModel
    @State private var isShowingLesson: Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                LessonListView(isShowingLesson: $isShowingLesson)
            }
            .fullScreenCover(isPresented: $isShowingLesson, content: {
                CalculView(isShowingLesson: $isShowingLesson, index: $yuriYurikaVM.currentLessonIndex)
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Laboratory")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                }
            }
        }
    }
}

struct LaboratoryView_Previews: PreviewProvider {
    static var previews: some View {
        LaboratoryView()
            .environmentObject(YuriYurikaViewModel())
    }
}
