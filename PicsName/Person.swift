//
//  Person.swift
//  PicsName
//
//  Created by Radu Petrisel on 23.07.2023.
//

import SwiftUI

struct Person: Identifiable, Comparable {
    let id = UUID()
    let image: Image
    let name: String
    
    static func <(lhs: Person, rhs: Person) -> Bool {
        lhs.name < rhs.name
    }
}
