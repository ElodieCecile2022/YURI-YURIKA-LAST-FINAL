//
//  Introduction.swift
//  yuriyurika
//
//  Created by Elodie Iparraguirre on 18/01/23.
//

import Foundation

struct Speech: Codable {
    let name: String
    let content: [String]
    var currentIndex: Int = 0
    var isFinished: Bool = false
    // Go on the next sentence of the speech
    mutating func goNext() {
        if currentIndex < (content.count - 1) { currentIndex += 1 } else { isFinished = true }
    }
    // The codingkeys represent the values in our JSON.
    enum CodingKeys: String, CodingKey {
        case name, content
    }
}

extension Speech {
    // Manage the errors of the JSON file.
    enum SpeechError: Error {
        case speechNotFound
        case speechDataNotFound
    }
    // Get all the speechs of the JSON file.
    static func all() throws -> [Speech] {
        do {
            return try Bundle.main.decode("speechs.json")
        } catch {
            throw SpeechError.speechDataNotFound
        }
    }
    // Get a specific speech, in the JSON file, from its name.
    static func get(_ name: String) throws -> Speech {
        guard let speech = try Speech.all().first(where: { $0.name == name }) else {
            throw SpeechError.speechNotFound
        }
        return speech
    }
}
