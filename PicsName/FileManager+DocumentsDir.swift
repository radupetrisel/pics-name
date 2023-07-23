//
//  FileManager+DocumentsDir.swift
//  PicsName
//
//  Created by Radu Petrisel on 23.07.2023.
//

import Foundation

extension FileManager {
    static var documentsDir: URL {
        Self.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
