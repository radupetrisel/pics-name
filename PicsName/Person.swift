//
//  Person.swift
//  PicsName
//
//  Created by Radu Petrisel on 23.07.2023.
//

import SwiftUI

struct Person: Identifiable {
    let id = UUID()
    let image: Image
    let name: String
}
