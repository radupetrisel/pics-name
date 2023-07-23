//
//  PhotoNamerView.swift
//  PicsName
//
//  Created by Radu Petrisel on 23.07.2023.
//

import SwiftUI

struct PhotoNamerView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var uiImage: UIImage?
    @State private var name = ""
    @State private var isShowingImagePicker = false
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(.gray)
                
                Text("Select image")
                
                if let uiImage = uiImage {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                }
            }
            .onTapGesture {
                isShowingImagePicker = true
            }
            
            TextField("Name", text: $name)
                .multilineTextAlignment(.center)
                .font(.title)
        }
        .padding()
        .sheet(isPresented: $isShowingImagePicker) {
            PhotoPickerView(image: $uiImage)
        }
        .toolbar {
            Button("Done") {
                dismiss()
            }
        }
    }
}

struct PhotoNamerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PhotoNamerView()
        }
    }
}
