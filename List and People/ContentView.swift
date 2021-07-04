//  ContentView.swift
//  List and People
//  Created by Holger Hinzberg on 22.06.21.

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var repo = PersonsRepository(randomPersonsCount: 10)
    
    init() {
        let customAppearance = UINavigationBarAppearance()
        // Backgroundcolor
        customAppearance.backgroundColor = UIColor.lightGray
        // Font color for navigationBarTitleDisplayMode large
        customAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        // Font color for navigationBarTitleDisplayMode inline
        customAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = customAppearance
        UINavigationBar.appearance().compactAppearance = customAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = customAppearance
    }
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(self.repo.persons, id: \.id) { person in
                    NavigationLink (destination: PersonDetailView(person: person))
                    {
                        PersonListCell(person: person)
                    }
                }
            }.listStyle(PlainListStyle())
                .navigationTitle("List and People")
                .navigationBarTitleDisplayMode(.large)
                .navigationBarItems(trailing:
                                        Button(action: {
                    self.repo.addRandomPerson()
                }) {
                    Image(systemName: "plus.circle.fill")
                } )
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
