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
            
            
            // Sorted data here. steps 1) decode data, 2) have a variable in the array (tableZeus) that represents distance, 3) wait until I have a user location, 4) then sorted data after I have a user location
            // distance is a variable in tableAdmin. After getting user location created a function to calculate distance
            
            for i in self.tableZeus {
                i.distance = i.location.distance(from: myLocation!)
                
            }
            
            // sort data after calculating distance
            
            self.tableZeus.sort { (b1, b2) -> Bool in
                return b1.distance ?? 0  < b2.distance ?? 0
            }
            
            // Stop requesting location after we get it once (if we need it once)
            
            locationManager.stopUpdatingLocation()
        }
    }
}


