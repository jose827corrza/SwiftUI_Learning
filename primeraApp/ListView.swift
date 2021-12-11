//
//  ListView.swift
//  primeraApp
//
//  Created by Jose Daniel Corredor Zambrano on 8/12/21.
//

import SwiftUI

private let programmers = [Programmer(id: 1, name: "Jose", languages: "Python, Java", avatar: Image(systemName: "person"), favourite: true),
                           Programmer(id: 2, name: "Pepe", languages: "Python, Java", avatar: Image(systemName: "person.fill"), favourite: false),
                           Programmer(id: 3, name: "Maria", languages: "Python, C++", avatar: Image(systemName: "person.fill"), favourite: false),
                           Programmer(id: 4, name: "Xiomara", languages: "Rust, Java", avatar: Image(systemName: "person.fill"), favourite: true),
                           Programmer(id: 5, name: "Juan", languages: "Python", avatar: Image(systemName: "person.fill"), favourite: false),
                           Programmer(id: 6, name: "Felipe", languages: "Python, HTML", avatar: Image(systemName: "person.fill"), favourite: false),
                           Programmer(id: 7, name: "Daniel", languages: "JS, Java", avatar: Image(systemName: "person.fill"), favourite: true)]

struct ListView: View {
    
    @State private var showFavourite = false
    
    private var filteredProgrammers: [Programmer]{
        return programmers.filter{programmer in
            return !showFavourite || programmer.favourite
            
        }
    }
    
    var body: some View {
        
        
        VStack{
            Toggle(isOn: $showFavourite) {
                Text("Mostar Favoritos")
            }.padding()
            NavigationView{
                List(filteredProgrammers, id: \.id){programmer in
                    NavigationLink(destination: ListDetailView(programmer: programmer)) {
                        RowView(programmer: programmer)
                    }
                    
                }
                .navigationTitle("Programadores")
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
