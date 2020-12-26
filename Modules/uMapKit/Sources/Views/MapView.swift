//
//  MapView.swift
//  
//
//  Created by Mateus Sousa on 26/12/20.
//

import SwiftUI
import MapKit
import uCore

public struct MapView: View {
    
    public init() { }
    
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.3353981, longitude: -122.0168472),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    
    public var body: some View {
        ZStack() {
            Map(coordinateRegion: $region)
            AvatarView()
            MapButtons()
            
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
