//
//  YuriYurikaViewModel.swift
//  yuriyurika
//
//  Created by Elodie Iparraguirre on 18/01/23.
//

import SwiftUI
import CoreData

class YuriYurikaViewModel: ObservableObject {
    init() {
        getIntroduction()
        fetchSavedLessons()
        loadLessonData()
        unlockFirstLessonAndAdventure()
    }
    static var shared = YuriYurikaViewModel()
    // Enum called API error that generates 3 types of errors for our HTTP request:
    // -1st error: an incorrect URL
    // -2nd error: a worn gresponse of the server
    // -3rd error: no data to get
    enum SuperHeroError: Error {
        case noSuperHero
    }
    // API Manager
    let apiManager = APIManager()
    let superHeroURL = "https://superheroapi.com/api/\(APIManager.superHeroToken)/"
    // MARK: - LESSONS
    @Published var calcul = Calcul()
    @Published var currentLessonIndex: Int = 0
    // MARK: - INTRODUCTIONS & HINTS
    @Published var isIntroductionDone: Bool = false
    @Published var isLaboratoryHintVisible = true
    @Published var isAdventureHintVisible = true
    @Published var isAchievementsHintVisible = true
    // MARK: - SPEECHS
    @Published var introduction: Speech?
    @Published var laboratoryHint: Speech?
    @Published var adventureHint: Speech?
    @Published var achievementsHint: Speech?
    // MARK: - MAINS
    @Published var lessons: [LessonEntity] = []
    @Published var superHeros = [SuperHero]()
    // MARK: MISCELLANEOUS
    // The changes on other classes doesnt not refresh the views,
    // so we need to do it manually by creating and changing this property inside the main View Model.
    @Published var refresh: Bool = false
    @AppStorage("Lesson Load") var hasLessonBeenLoaded: Bool = false
    // MARK: - FETCHS
    func fetchSuperHero(_ id: String) async throws -> SuperHero {
        do {
            let superHero = try await apiManager.getRequest(url: superHeroURL + id, model: SuperHero.self)
            return superHero
        } catch {
            throw SuperHeroError.noSuperHero
        }
    }
    func fetchSuperHeros() async throws -> [SuperHero] {
        var heros = [SuperHero]()
        let heroIds = ["527", "149"]
        for id in heroIds {
            let hero = try await fetchSuperHero(id)
            heros.append(hero)
        }
        return heros
    }
    func getSuperHero(_ name: String) -> SuperHero? {
        if let superHero = superHeros.first(where: { $0.name == name }) {
            return superHero
        }
        return nil
    }
    func getIntroduction() {
        do {
            introduction = try Speech.get("Introduction")
        } catch {
            print(error)
        }
    }
    // MARK: - HELPS
    // End introduction of the app
    func endIntroduction() {
        guard let introduction = introduction else { return }
        if introduction.isFinished { isIntroductionDone = true }
    }
    // MARK: PROGRESSION
    // Unlock the first lesson and the first adventure
    func unlockFirstLessonAndAdventure() {
        lessons[0].isUnlocked = true
    }
    // Advance in the lesson progression
    func progressInLesson() {
        if lessons[currentLessonIndex].currentProgress < 1 {
            lessons[currentLessonIndex].currentProgress += 0.1
            if lessons[currentLessonIndex].currentProgress > 1 {
                lessons[currentLessonIndex].isDone = true
                if let index = lessons.firstIndex(where: { !$0.isUnlocked }) {
                    lessons[index].isUnlocked = true
                }
                refresh.toggle()
            } else {
                lessons[currentLessonIndex].isDone = false
                refresh.toggle()
            }
            saveData()
        }
    }
    func regressInLesson() {
        if lessons[currentLessonIndex].currentProgress > 0 {
            lessons[currentLessonIndex].currentProgress -= 0.1
            saveData()
        }
    }
    // Generate a new calcul for the current lesson
    func generateNewCalcul(_ index: Int) {
        switch lessons[index].category {
        case "addition":
            calcul.generateNewAddition()
        default:
            print("This lesson category does not exists")
        }
    }
    // Check if the entry is correct for the current calcul
    func checkCurrentCalcul(_ index: Int, entry: inout String) {
        switch lessons[index].category {
        case "addition":
            calcul.checkAdditionAnswer(from: &entry)
        default:
            print("This lesson category does not exists")
        }
    }
    // function newly created to load the lessons data
    func loadLessonData() {
        if !hasLessonBeenLoaded {
            if let allLessons = try? Lesson.all() {
                for lesson in allLessons {
                    let newLesson = LessonEntity(context: PersistenceController.shared.container.viewContext)
                    newLesson.name = lesson.name
                    newLesson.image = lesson.image
                    newLesson.category = lesson.category.rawValue
                    newLesson.currentProgress = 0
                    newLesson.maxProgress = 10
                    newLesson.createdAt = Date.now
                    newLesson.scores = []
                    saveData() // now that we have create the data in the entity, we save the data
                    hasLessonBeenLoaded = true
                }
            }
        }
    }
    func fetchSavedLessons() {
        // variable of the request It is the request on the saved data. It is the lesson entity that is concerned.
        let sorting = [NSSortDescriptor(keyPath: \LessonEntity.createdAt, ascending: true)]
        let request = NSFetchRequest<LessonEntity>(entityName: "LessonEntity")
        request.sortDescriptors = sorting
        do { // fetch is to get the data of lesson.
            lessons = try PersistenceController.shared.container.viewContext.fetch(request)
        } catch {
            // if save fails, it shows an error.
            print(error)
        }
    }
    func saveData() {
        do {
            try PersistenceController.shared.container.viewContext.save()
            // we look for the container inside. we try to save. Inside the catch, we print the error.
            fetchSavedLessons() // we need to fetch the data to get the data after saving.
        } catch {
            // if save fails, it shows an error.
            print(error)
        }
    }
}
