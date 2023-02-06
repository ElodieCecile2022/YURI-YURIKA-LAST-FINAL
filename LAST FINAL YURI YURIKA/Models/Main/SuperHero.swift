//
//  SuperHero.swift
//  yuriyurika
//
//  Created by Elodie Iparraguirre on 20/01/23.
//

import Foundation

// MARK: - Welcome
struct SuperHero: Codable {
    let response, id, name: String
    let image: SuperHeroImage
}

// MARK: - Image
struct SuperHeroImage: Codable {
    let url: String
}
