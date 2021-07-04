//  PersonDetailView.swift
//  List and People
//  Created by Holger Hinzberg on 02.07.21.

import SwiftUI

struct PersonDetailView: View {
    
    var person : Person
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Hello, my name is")
                    .font(.title2)
                Text("\(person.firstName) \(person.lastName).")
                    .font(.title2)
            }.padding(10)
            HStack {
                Text("I was born")
                    .font(.title2)
                Text("\(person.birthday.formatted(.dateTime.year().month().day())).")
                    .font(.title2)
            }.padding(10)
            Spacer()
        }.padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
    }
}

struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailView(person:  RandomPersonGenerator.shared.generate())
    }
}
