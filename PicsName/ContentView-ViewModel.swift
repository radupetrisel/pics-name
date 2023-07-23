//
//  ContentView-ViewModel.swift
//  PicsName
//
//  Created by Radu Petrisel on 23.07.2023.
//

import SwiftUI

extension ContentView {
    @MainActor final class ViewModel: ObservableObject {
        @Published private(set) var people = [Person]()
        
        func addPerson(uiImage: UIImage, name: String) {
            people.append(Person(image: Image(uiImage: uiImage), name: name))
        }
    }
}
