//
//  RowView.swift
//  primeraApp
//
//  Created by Jose Daniel Corredor Zambrano on 8/12/21.
//

import SwiftUI

struct RowView: View {
    var programmer: Programmer
    
    var body: some View {
        HStack{
            programmer.avatar
                .resizable()
                .frame(width: 50, height: 50)
                .padding(10)
            VStack(alignment: .leading){
                Text(programmer.name)
                    .font(.title)
                Text(programmer.languages)
            }
            Spacer()
            
            if(programmer.favourite) {
                Image(systemName: "star.fill")
                    .foregroundColor(Color.yellow)
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(programmer: Programmer(id: 1, name: "Jose", languages: "Python, Java", avatar: Image(systemName: "person.fill"), favourite: true))
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
