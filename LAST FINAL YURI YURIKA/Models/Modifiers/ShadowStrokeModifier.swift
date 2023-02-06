//
//  ShadowStrokeModifier.swift
//  yuriyurika
//
//  Created by Elodie Iparraguirre on 14/01/23.
//

import SwiftUI

// Modifier to add a stroke to a view
struct ShadowStrokeModifier: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .shadow(color: color, radius: 0.4)
            .shadow(color: color, radius: 0.4)
            .shadow(color: color, radius: 0.4)
            .shadow(color: color, radius: 0.4)
            .shadow(color: color, radius: 0.4)
            .shadow(color: color, radius: 0.4)
            .shadow(color: color, radius: 0.4)
            .shadow(color: color, radius: 0.4)
            .shadow(color: color, radius: 0.4)
            .shadow(color: color, radius: 0.4)
    }
}
