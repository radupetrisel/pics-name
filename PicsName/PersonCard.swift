//
//  PersonCard.swift
//  PicsName
//
//  Created by Radu Petrisel on 23.07.2023.
//

import SwiftUI

struct PersonCard: View {
    let image: Image
    let name: String
    
    var body: some View {
        VStack(spacing: 0) {
            image
                .resizable()
                .scaledToFill()
            
            Text(name)
                .padding()
                .font(.title.bold())
                .frame(maxWidth: .infinity)
                .background(.cyan)
                .foregroundColor(.primary)
        }
        .frame(width: 300, height: 400)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.secondary, lineWidth: 4)
        }
    }
}

struct PersonCard_Previews: PreviewProvider {
    static var previews: some View {
        PersonCard(image: Image("Test"), name: "Test")
    }
}
