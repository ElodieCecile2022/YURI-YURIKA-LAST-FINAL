//
//  PressButtonModifier.swift
//  yuriyurika
//
//  Created by Elodie Iparraguirre on 14/01/23.
//

import SwiftUI

// Modifier to give little press animation to a button
struct PressButtonModifier: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
    }
}
