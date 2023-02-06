//
//  TabBarView.swift
//  yuriyurika
//
//  Created by Elodie Iparraguirre on 18/01/23.
//

import SwiftUI

// This view represent the Tab bar (The bar at the bottom of the screen) and contains all the views of the app.
struct TabBarView: View {
    @EnvironmentObject var yuriyurikaVM: YuriYurikaViewModel
    var body: some View {
        if yuriyurikaVM.isIntroductionDone {
            TabView {
                LaboratoryView()
                    .tabItem {
                        Image(systemName: "lamp.desk.fill")
                        Text("Laboratory")
                    }
            }
        } else {
            IntroductionView()
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .environmentObject(YuriYurikaViewModel())
    }
}
