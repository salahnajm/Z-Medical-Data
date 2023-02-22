//
//  ZeusMapView.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/17/22.
//

import SwiftUI
import MapKit
import CoreLocation

var annotation = [MKPointAnnotation]()

struct ZeusMapView: UIViewRepresentable {
    
    var selectedMapLat:Double?
    var selectedMapLong:Double?
    var selectedMapTitle:String?
    
    @EnvironmentObject var model:ZeusModel
    
    func makeUIView(context: Context) -> MKMapView {
        
        let mapView = MKMapView()
        
        //create delegate to be able to click on annotations
        mapView.delegate = context.coordinator
        
        //   Make the user show up on the map
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
            
        
        uiView.removeAnnotations(uiView.annotations)
        annotation.removeAll()
        
        //create a new annotation
        
        let a = MKPointAnnotation()
        a.coordinate = CLLocationCoordinate2D(latitude: selectedMapLat!, longitude: selectedMapLong!)
        
        a.title = selectedMapTitle ?? ""
        
        annotation.append(a)
        
        uiView.addAnnotations(annotation)
        uiView.showAnnotations(uiView.annotations, animated: true)
        
        
        
    }
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        
        uiView.removeAnnotations(uiView.annotations)
    }
    
    // add links on annotation to get details
    func makeCoordinator() -> Coordinator {
        
        return Coordinator(rental: self)
        
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        var rental:ZeusMapView
        
        init(rental:ZeusMapView) {
            
            self.rental = rental
            
        }
        
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            // Resuse annotations
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "item")
            
            // there is no previous annotions and make a new one
            if annotationView == nil {
                
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "item")
                
                //shows callout bubble
                annotationView!.canShowCallout = true
                // make bubble a button
                annotationView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }
            else {
                
                annotationView!.annotation = annotation
            }
            
            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            
            //            for business in rental.model.list {
            //
            //                if business.Address == view.annotation?.title {
            //
            //                    rental.selectedRental = business
            //
            //                    return
            //                }
            //            }
            
        }
        
    }
}
