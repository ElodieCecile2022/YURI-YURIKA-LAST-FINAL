//
//  IntroductionView.swift
//  yuriyurika
//
//  Created by Elodie Iparraguirre on 11/01/23.
//

import SwiftUI

// This view is the speech introduction of the app.
struct IntroductionView: View {
    @EnvironmentObject var yuriyurikaVM: YuriYurikaViewModel
    var body: some View {
        NavigationView {
            VStack {
                if let url = yuriyurikaVM.getSuperHero("Professor X")?.image.url,
                   let introduction = yuriyurikaVM.introduction {
                    if !introduction.isFinished {
                        FetchedImageView(url: url)
                            .scaledToFit()
                            .cornerRadius(10)
                        Text(introduction.content[introduction.currentIndex])
                            .font(.system(size: 25, weight: .regular, design: .rounded))
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.2)
                            .padding()
                    }
                    ActionButtonView(
                        label: introduction.isFinished ? "Start your journey" : "Next",
                        backgroundColor: Color.primary) {
                        yuriyurikaVM.endIntroduction()
                        yuriyurikaVM.introduction?.goNext()
                    }
                }
            }
            .padding()
        }
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
            .environmentObject(YuriYurikaViewModel())
    }
}

/*
 VStack(spacing: 30) {
 Text("HELLO")
 .font(.system(.largeTitle, design: .rounded, weight: .black))
 .foregroundColor(.white)
 .padding()
 .frame(maxWidth: .infinity)
 .background(
 Color.accentColor
 .cornerRadius(10)
 .shadow(color: .accentColor, radius: 0, x: -1, y: -1)
 .shadow(color: .accentColor, radius: 0, x: 7, y: 7)
 )
 
 Button(action: {
 
 }) {
 Text("MATHS")
 .font(.system(.largeTitle, design: .rounded, weight: .black))
 .foregroundColor(.accentColor)
 .padding()
 .frame(maxWidth: .infinity)
 .background(
 Color.white
 .cornerRadius(10)
 .shadow(color: .accentColor, radius: 0, x: -1, y: -1)
 .shadow(color: .accentColor, radius: 0, x: 7, y: 7)
 )
 .overlay(
 Image("maths")
 .resizable()
 .scaledToFit()
 .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
 .padding(10)
 .shadowStroke(color: .accentColor)
 .padding(.leading)
 )
 }
 .buttonStyle(PressButtonModifier())
 }
 Spacer()
 */
