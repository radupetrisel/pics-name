//
//  PersonDetailView.swift
//  PicsName
//
//  Created by Radu Petrisel on 24.07.2023.
//

import CoreLocation
import MapKit
import SwiftUI

struct PersonDetailView: View {
    let image: Image
    let name: String
    let location: CLLocationCoordinate2D
    
    @State private var mapRegion: MKCoordinateRegion
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 50) {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width)
                
                VStack {
                    Section {
                        Map(coordinateRegion: $mapRegion, annotationItems: [MapLocation(location: location)]) {
                            MapMarker(coordinate: $0.location)
                        }
                        .frame(width: geo.size.width, height: geo.size.height * 0.5)
                    } header: {
                        Text("Location")
                            .font(.callout)
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        }
        .navigationTitle(name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    init(image: Image, name: String, location: CLLocationCoordinate2D) {
        self.image = image
        self.name = name
        self.location = location
        
        _mapRegion = State(initialValue: MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)))
    }
    
    struct MapLocation: Identifiable {
        let id = UUID()
        let location: CLLocationCoordinate2D
    }
}

struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailView(image: Image("Test"), name: "Person", location: CLLocationCoordinate2D())
    }
}
