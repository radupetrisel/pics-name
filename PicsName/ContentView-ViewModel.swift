//
//  ContentView-ViewModel.swift
//  PicsName
//
//  Created by Radu Petrisel on 23.07.2023.
//

import SwiftUI

extension ContentView {
    @MainActor final class ViewModel: ObservableObject {
        private static let peopleKey = "people"
        
        @Published private(set) var people: [Person]
        
        @Published var imageSaveDidHaveErrors = false
        
        init() {
            if let jsonData = UserDefaults.standard.data(forKey: Self.peopleKey) {
                if let people = try? JSONDecoder().decode([Person].self, from: jsonData) {
                    self.people = people
                    return
                }
            }
            
            people = []
        }
        
        func addPerson(uiImage: UIImage, name: String) {
            if let jpegData = uiImage.jpegData(compressionQuality: 1.0) {
                let imageName = UUID().uuidString
                let imagePath = FileManager.documentsDir.appending(component: imageName)
                do {
                    try jpegData.write(to: imagePath, options: [.atomic, .completeFileProtection])
                    people.append(Person(imageName: imageName, name: name, latitude: 0, longitude: 0))
                    save()
                } catch {
                    imageSaveDidHaveErrors = true
                }
            }
        }
        
        func save() {
            do {
                let jsonData = try JSONEncoder().encode(people)
                
                UserDefaults.standard.set(jsonData, forKey: Self.peopleKey)
            } catch {
                print("Could not save people to UserDefaults.")
            }
        }
    }
}
