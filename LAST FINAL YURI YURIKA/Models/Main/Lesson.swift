//
//  Lesson.swift
//  yuriyurika
//
//  Created by Elodie Iparraguirre on 14/01/23.
//

import SwiftUI

struct Lesson: Identifiable, Codable {
    var id = UUID()
    let name: String
    let image: String?
    let category: Category
    var currentProgress: Double = 0
    var maxProgress: Double = 10
    var isDone: Bool = false
    var isUnlocked: Bool = false
    enum Category: String, Codable {
        case addition
    }
    // The codingkeys represent the values in our JSON.
    enum CodingKeys: String, CodingKey {
        case name, image, category
    }
}

extension Lesson {
    enum LessonError: Error {
        case noLessonDataFound
    }
    // Get all the lessons of the JSON file.
    static func all() throws -> [Lesson] {
        do {
            return try Bundle.main.decode("lessons.json")
        } catch {
            throw LessonError.noLessonDataFound
        }
    }
}
