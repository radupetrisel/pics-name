//
//  Person.swift
//  PicsName
//
//  Created by Radu Petrisel on 23.07.2023.
//

import SwiftUI

struct Person: Identifiable, Codable, Comparable {
    let id = UUID()
    let imagePath: URL
    let name: String
    
    var image: UIImage {
        let jpegData = try! Data(contentsOf: imagePath)
        return UIImage(data: jpegData)!
    }
    
    static func <(lhs: Person, rhs: Person) -> Bool {
        lhs.name < rhs.name
    }
    
    enum CodingKeys: CodingKey {
        case imagePath
        case name
    }
}
