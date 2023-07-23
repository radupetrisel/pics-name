//
//  ContentView-ViewModel.swift
//  PicsName
//
//  Created by Radu Petrisel on 23.07.2023.
//

import Foundation

extension ContentView {
    @MainActor final class ViewModel: ObservableObject {
        @Published var people = [Person]()
    }
}
