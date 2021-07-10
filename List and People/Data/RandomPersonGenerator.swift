//  RandomPersonGenerator.swift
//  List and People
//  Created by Holger Hinzberg on 22.06.21.

import Foundation

public class RandomPersonGenerator {
    
    static let shared = RandomPersonGenerator()
    private var firstNames = [String]()
    private var lastNames = [String]()
    private var companies = [String]()
    private let minBirthYear = 1960
    private let maxBirthYear = 2010
    
    private init()
    {
        firstNames.append(contentsOf: ["Rose", "Billie", "Ben", "Ken", "Michael", "Thomas", "Mike", "Kenzie"])
        firstNames.append(contentsOf: ["Jane", "John", "Russel", "George", "Kagney", "Arnold"])
        firstNames.append(contentsOf: ["Bruce", "Steve", "Patty", "Bill", "Ted", "Peter", "David", "May", "Gwen"])
        lastNames.append(contentsOf: ["Swift", "Piper", "Steele", "Rogers", "Stark", "Hawkins", "Lee", "Kirby"] )
        lastNames.append(contentsOf: ["Cambell", "Hart", "Jordan", "Fielding", "Crispin","Ford", "Jones"])
        lastNames.append(contentsOf: ["Anderson", "Reeves", "Sagan", "Morgan", "Parker", "Watson"])
        
        companies.append(contentsOf: ["Apple", "Microsoft", "Dell"])
    }
    
    private func getRandomDate() -> Date {
        
        var minComponents = DateComponents()
        minComponents.year = self.minBirthYear
        minComponents.month = 1
        minComponents.day = 1
        let minDate = Calendar.current.date(from: minComponents)

        var maxComponents = DateComponents()
        maxComponents.year = self.maxBirthYear
        maxComponents.month = 12
        maxComponents.day = 31
        let maxDate = Calendar.current.date(from: maxComponents)
        
        let span = TimeInterval.random(in: minDate!.timeIntervalSinceNow...maxDate!.timeIntervalSinceNow)
        return Date(timeIntervalSinceNow: span)
    }
            
    public func generate() -> Person {
        let person = Person()
        person.firstName = self.firstNames.randomElement()!
        person.lastName = self.lastNames.randomElement()!
        person.company = self.companies.randomElement()!
        person.birthday = self.getRandomDate()
        return person
    }    
}
