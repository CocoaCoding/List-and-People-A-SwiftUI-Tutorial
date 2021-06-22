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
}
