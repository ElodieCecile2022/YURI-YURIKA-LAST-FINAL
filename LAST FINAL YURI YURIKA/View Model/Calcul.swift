//
//  Calcul.swift
//  yuriyurika
//
//  Created by Elodie Iparraguirre on 18/01/23.
//

import Foundation
import SwiftUI

class Calcul: ObservableObject {
    @Published var generatedCalcul = ""
    @Published var correctAnswer = false
    @Published var incorrectAnswer = false
    @Published var answer: Answer = .guess
    enum Answer: String {
        case guess
        case badAnswer
        case rightAnswer
        var color: Color {
            switch self {
            case .guess:
                return .black
            case .badAnswer:
                return .red
            case .rightAnswer:
                return .green
            }
        }
        var image: String {
            switch self {
            case .guess:
                return "questionmark"
            case .badAnswer:
                return "multiply"
            case .rightAnswer:
                return "checkmark"
            }
        }
    }
//    @Published var answer: Answer = .guess
    // Update the calculator entry
    func updateEntry(entry: inout String, with touch: String, index: Int) {
        switch true {
        case touch == "C": entry.removeAll()
        // case touch == "D": entry.popLast()
        default:
            entry.append(touch)
            //            YuriYurikaViewModel.shared.checkCurrentCalcul(index, entry: &entry)
        }
    }
    // Function to check if the ENTRY you tapped on the calculator is the correct result of the addition CALCUL.
    func isAdditionCorrect(from calcul: String, with entry: String) -> Bool {
        let stringArray = calcul.components(separatedBy: CharacterSet.decimalDigits.inverted)
        var numbers = [Int]()
        for item in stringArray {
            if let number = Int(item) { numbers.append(number) }
        }
        let result = numbers.reduce(0, +)
        let answer = Int(entry)
        if String(result).count != entry.count {return false}
        return result == answer
    }
    // Function to generate a new calcul with a specific SIGN.
    func generatedRandomCalcul(of sign: String) -> String {
        let firstNumber = Int.random(in: 1..<11)
        let secondNumber = Int.random(in: 1..<11)
        return firstNumber >= secondNumber ?
        "\(firstNumber) \(sign) \(secondNumber)" :
        "\(secondNumber) \(sign) \(firstNumber)"
    }
    // MARK: - Calcul Logic
    // Generate a new addition
    func generateNewAddition() {
        generatedCalcul = generatedRandomCalcul(of: "+")
//        YuriYurikaRandomSt.YuriRM.arrOfessons.append(generatedCalcul)
//        YuriYurikaViewModel.shared.refresh.toggle()
    }
    // Check the result of the entry for the addition calcul
    func checkAdditionAnswer(from entry: inout String) {
//        YuriYurikaRandomSt.YuriRM.idx = 0
        if isAdditionCorrect(from: generatedCalcul, with: entry) {
//            YuriYurikaRandomSt.YuriRM.correctAnswer = "A"
//            YuriYurikaRandomSt.YuriRM.incorrectAnswer = nil
            answer = .rightAnswer
            YuriYurikaViewModel.shared.refresh.toggle()
        } else {
            answer = .badAnswer
            YuriYurikaViewModel.shared.refresh.toggle()
//            YuriYurikaRandomSt.YuriRM.incorrectAnswer = "B"
//            YuriYurikaRandomSt.YuriRM.correctAnswer = nil
        }
    }
}
