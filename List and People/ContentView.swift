//  ContentView.swift
//  List and People
//  Created by Holger Hinzberg on 22.06.21.

import SwiftUI

struct ContentView: View {
    
    @State private var searchText = ""
    @ObservedObject var repo = PersonsRepository(randomPersonsCount: 10)
    
    init() {
        let customAppearance = UINavigationBarAppearance()
        // Backgroundcolor
        customAppearance.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 1.0, alpha: 1)
        // Font color for navigationBarTitleDisplayMode large
        customAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemBlue]
        // Font color for navigationBarTitleDisplayMode inline
        customAppearance.titleTextAttributes = [.foregroundColor: UIColor.systemBlue]
        
        UINavigationBar.appearance().standardAppearance = customAppearance
        UINavigationBar.appearance().compactAppearance = customAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = customAppearance
    }
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach (self.repo.getSections(searchText: self.searchText) , id:\.self ) { section in
                    Section(header: SectionHeader(headlineText: section)) {
                        ForEach(self.repo.persons.filter {$0.company == section && $0.matchesFilter(searchText: self.searchText) }  , id: \.id) { person in
                            NavigationLink (destination: PersonDetailView(person: person))
                            {
                                PersonListCell(person: person)
                                    .badge(Text(person.getAge())
                                            .foregroundColor(Color.blue)
                                            .font(.subheadline )
                                    )
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
                .listRowSeparatorTint( Color(red: 0.2, green: 0, blue: 1.0, opacity: 0.5) )
                
            }.listStyle(PlainListStyle())
                .refreshable {
                    await self.repo.addRandomPersonAsync()
                }
                .searchable(
                    text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Search something...")
                .onChange(of: searchText) { searchText in
                    print(searchText)
                }
            
                .navigationTitle("List and People")
                .navigationBarTitleDisplayMode(.large)
                .navigationBarItems(trailing:
                                        Button(action: {
                    self.repo.addRandomPerson()
                }) {
                    Image(systemName: "plus.circle.fill").tint(Color(UIColor.systemBlue))
                } )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
