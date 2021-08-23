//  Person.swift
//  List and People
//  Created by Holger Hinzberg on 22.06.21.

import Foundation

public class Person {
    let id = UUID()
    var firstName : String = ""
    var lastName : String = ""
    var birthday : Date = Date()
    var company : String = ""
    
    public func getAge() -> String {
        let today = Date()
        let differenceComponents = Calendar.current.dateComponents([.year], from: self.birthday, to: today)
        let yearDifference = differenceComponents.year
        return "\(yearDifference!) Years"
    }
    
    public func matchesFilter(searchText : String) -> Bool {
        
        if  searchText.isEmpty ||
            self.firstName.range(of: searchText, options: .caseInsensitive) != nil ||
            self.lastName.range(of: searchText, options: .caseInsensitive) != nil ||
            self.company.range(of: searchText, options: .caseInsensitive) != nil {
            return true
        }
        return false
    }
}
