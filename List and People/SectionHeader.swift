//  SectionHeader.swift
//  List and People
//  Created by Holger Hinzberg on 06.07.21.

import SwiftUI

struct SectionHeader: View
{
    var headlineText : String
    let backColor = Color.white
    let foreColor = Color.blue
    
    var body: some View {
            HStack {
                Text(headlineText)
                    .font(.largeTitle)
                    .foregroundColor(foreColor)
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 5, trailing: 0))
                Spacer()
            }
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .background(backColor)
    }
}

struct SectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeader(headlineText: "Headline")
    }
}
