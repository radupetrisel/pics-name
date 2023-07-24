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
                    ForEach(viewModel.people.sorted()) { person in
                        NavigationLink {
                            PersonDetailView(image: Image(uiImage: person.image), name: person.name, location: person.location)
                        } label: {
                            PersonCard(image: Image(uiImage: person.image), name: person.name)
                        }
                        .padding([.bottom, .horizontal])
                    }
                }
            }
            .toolbar {
                NavigationLink {
                    PhotoNamerView { uiImage, name in
                        viewModel.addPerson(uiImage: uiImage, name: name)
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
