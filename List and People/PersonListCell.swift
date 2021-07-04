//  PersonListCell.swift
//  List and People
//  Created by Holger Hinzberg on 01.07.21.

import SwiftUI

struct PersonListCell: View {
    
    var person : Person
    
    var body: some View {
        
        VStack {
            HStack {
                Text("\(person.firstName) \(person.lastName)")
                    .font(.title)
                Spacer()
            }
            HStack {
                Text("\(person.birthday.formatted(.dateTime.year().month().day()))")
                    .font(.body).foregroundColor(.secondary)
                Spacer()
            }            
        }.padding(EdgeInsets(top: 1, leading: 5, bottom: 1, trailing: 0))
    }
}

struct PersonListCell_Previews: PreviewProvider {
    static var previews: some View {
        PersonListCell(person:  RandomPersonGenerator.shared.generate())
    }
}
