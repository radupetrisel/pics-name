//
//  Person.swift
//  PicsName
//
//  Created by Radu Petrisel on 23.07.2023.
//

import SwiftUI

struct Person: Identifiable, Codable, Comparable {
    let id = UUID()
    let imageName: String
    let name: String
    
    var image: UIImage {
        let jpegData = try! Data(contentsOf: FileManager.documentsDir.appending(component: imageName))
        return UIImage(data: jpegData)!
    }
    
    static func <(lhs: Person, rhs: Person) -> Bool {
        lhs.name < rhs.name
    }
    
    enum CodingKeys: CodingKey {
        case imageName
        case name
    }
}
