//
//  List_and_PeopleTests.swift
//  List and PeopleTests
//
//  Created by Holger Hinzberg on 22.06.21.
//

import XCTest
@testable import List_and_People

class List_and_PeopleTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let person = RandomPersonGenerator.shared.generate()
        XCTAssertNotNil(person)
        XCTAssertNotEqual(person.firstName, "")
        XCTAssertNotEqual(person.lastName, "")
        XCTAssertNotNil(person.birthday)
        
        let personCount = 5
        let personsRepo = PersonsRepository(randomPersonsCount: personCount)
        XCTAssertEqual(personsRepo.persons.count, personCount)
        
    }
    
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
