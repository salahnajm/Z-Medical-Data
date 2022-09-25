//
//  BusinessSearch.swift
//  City Sights App
//
//  Created by Salah Najm on 8/19/22.
//


import Foundation
import MapKit
import SwiftUI
import CoreLocation

class BusinessSearch:  Identifiable, ObservableObject {
    
  //  @EnvironmentObject var model:ZeusModel
    
    var businesses = [tableAdmin]()
    var myLocation: CLLocation!

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

    let location = locations[locations.count - 1]
    if location.horizontalAccuracy > 0 {
   //     locationManager.stopUpdatingLocation()
    }
        self.myLocation = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//    self.myLocation = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude) //Print shows current loc
    }
    
    func sortBusiness() -> [tableAdmin] {
        
        businesses.sort(by: { $0.distance(to: myLocation) < $1.distance(to: myLocation) })
        
        print(businesses)
        
        return businesses
    }
    

    
    
 //   businesses.sort(by: T##(Self.Element, Self.Element) -> Bool)
    
//    businesses.sort(by: { $0.distance(to: myLocation) < $1.distance(to: myLocation) })

}



