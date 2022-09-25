//
//  ZeusModel.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/17/22.
//

import Foundation
import MapKit


class ZeusModel:  NSObject, CLLocationManagerDelegate, ObservableObject {
    
    @Published var categories2 = Set<String>()
    @Published var selectedCategory: String?
    
    @Published var userLocation:CLLocation?
    
    @Published var doctors = [Zeus]()
    @Published var tableZeus = [tableAdmin]()
    
    var locationManager = CLLocationManager()
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
 
    
    // Set myLocation as a CLLocation 
    var myLocation: CLLocation!
    
    override init() {
        super.init()
        
        // Set contentmodel as delegate of location manager
        locationManager.delegate = self
                
        let service = DataService()
       
        self.doctors = service.getLocalData()
        self.tableZeus = service.getLocalData2()
        self.categories2 = Set(self.tableZeus.map { r in return r.categories})
        self.categories2.update(with: "All Recipes")
    }
    
    func requestGeolocationPermission() {
        
        locationManager.requestWhenInUseAuthorization()
    }
  
    // MARK: Location Manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        authorizationState = locationManager.authorizationStatus
        
        print(authorizationState)
        
        if locationManager.authorizationStatus == .authorizedAlways ||
            locationManager.authorizationStatus == .authorizedWhenInUse {
            
            // We haver permission to locate user
            // Start geolocating after granting permission. Then start geolocating user
            locationManager.startUpdatingLocation()
            
        }
        
        else if locationManager.authorizationStatus == .denied {
            
            // We don't have permission
        }
    }
 
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Gives us the location of the user
        
         userLocation = locations.first
        
        if userLocation != nil {
           
            let location = locations[locations.count - 1]
            self.myLocation = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            // We have a location
            // Stop requesting location after we get it once (if we need it once)
            
            locationManager.stopUpdatingLocation()
           
        }
        
        
//
//        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//
//        let location = locations[locations.count - 1]
//        if location.horizontalAccuracy > 0 {
//       //     locationManager.stopUpdatingLocation()
//        }
//            self.myLocation = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//    //    self.myLocation = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude) //Print shows current loc
//        }
//
        
        
        
    }
    
    
    
    
    
    
    
    
    
  
}


