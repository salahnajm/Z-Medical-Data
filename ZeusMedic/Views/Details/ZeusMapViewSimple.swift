//
//  ZeusMapViewSimple.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/22/22.
//

import SwiftUI
import MapKit

struct ZeusMapViewSimple: View {
    
    
    @State var region = MKCoordinateRegion(
        center:  CLLocationCoordinate2D(
            latitude: 37.789467,
            longitude:-124.415772
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.5,
            longitudeDelta: 0.5
        )
    )
    
    var body: some View {
//        
//        Map(coordinateRegion: $region, annotationItems: Items) {
//        MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: 37.789467, longitude: -124.415772) ) {
//            
            Text("XX")
        }
 
}

struct ZeusMapViewSimple_Previews: PreviewProvider {
    static var previews: some View {
        ZeusMapViewSimple()
    }
}
