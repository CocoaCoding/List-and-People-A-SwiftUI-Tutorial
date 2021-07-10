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
                ForEach (self.repo.getSections(), id:\.self ) { section in
                    Section(header: SectionHeader(headlineText: section)) {
                        ForEach(self.repo.persons.filter {$0.company == section}  , id: \.id) { person in
                            NavigationLink (destination: PersonDetailView(person: person))
                            {
                                PersonListCell(person: person)
                            }
                            .swipeActions(edge: .leading , allowsFullSwipe: true) {
                                Button {
                                    print("Sent Button")
                                } label: {
                                    Label("Send", systemImage: "paperplane.fill")
                                }
                                .tint(.indigo)
                                
                                Button {
                                    print("Bookmark Button")
                                } label: {
                                    Label("Bookmark", systemImage: "bookmark.circle")
                                }
                                .tint(.teal)
                            }
                            
                            .swipeActions(edge: .trailing , allowsFullSwipe: true) {
                                Button {
                                    withAnimation {
                                        self.repo.delete(person: person)
                                    }
                                } label: {
                                    Label("Delete", systemImage: "trash.fill")
                                }
                                .tint(.red)
                            }
                        }
                    }
                }
                //.listRowSeparator(.hidden, edges: .top)
                .listRowSeparatorTint( Color(red: 0.2, green: 0, blue: 1.0, opacity: 0.5) )
                
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
