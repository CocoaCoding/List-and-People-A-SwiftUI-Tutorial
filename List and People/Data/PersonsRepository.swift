//  PersonsRepository.swift
//  List and People
//  Created by Holger Hinzberg on 22.06.21.

import SwiftUI

public class PersonsRepository : ObservableObject  {

    @Published var persons = [Person]()
    
    init(randomPersonsCount : Int) {
                
        for _ in 0..<randomPersonsCount {
            self.persons.append(RandomPersonGenerator.shared.generate())
        }        
    }

    func addRandomPerson() {
        self.persons.insert(RandomPersonGenerator.shared.generate(), at: 0)
    }
    
    func getSections() -> [String] {
        
        var sections  = [String]()
    
        for person in self.persons {
            if !sections.contains(person.company) {
                sections.append(person.company)
            }
        }
        return sections.sorted()
    }
    
    func delete(person : Person) {
        self.persons.removeAll(where: {$0.id == person.id } )
    }
    
}
