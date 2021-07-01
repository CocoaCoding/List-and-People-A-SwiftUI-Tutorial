//  ContentView.swift
//  List and People
//  Created by Holger Hinzberg on 22.06.21.

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var repo = PersonsRepository(randomPersonsCount: 10)
        
   var body: some View {

       List {
            ForEach(self.repo.persons, id: \.id) { person in
                PersonListCell(person: person)
            }
        }.listStyle(PlainListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
