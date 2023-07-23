//
//  ContentView.swift
//  PicsName
//
//  Created by Radu Petrisel on 23.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var uiImage: UIImage?
    @State private var isShowingPhotoPicker = false
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(.gray)
                
                Text("Select image")
                    .foregroundColor(.white)
                
                if let uiImage = uiImage {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                }
            }
            .onTapGesture {
                isShowingPhotoPicker = true
            }
        }
        .padding()
        .sheet(isPresented: $isShowingPhotoPicker) {
            PhotoPickerView(image: $uiImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
