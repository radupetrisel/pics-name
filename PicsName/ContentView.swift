//
//  ContentView.swift
//  PicsName
//
//  Created by Radu Petrisel on 23.07.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(viewModel.people) { person in
                        VStack {
                            person.image
                                .resizable()
                                .scaledToFit()
                            
                            Text(person.name)
                                .font(.title)
                        }
                    }
                }
            }
            .toolbar {
                NavigationLink {
                    PhotoNamerView { uiImage, name in
                        let person = Person(image: Image(uiImage: uiImage), name: name)
                        viewModel.people.append(person)
                    }
                } label: {
                    Label("Add", systemImage: "plus")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
