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
    
    @Published var doctors = [Zeus]()
    @Published var tableZeus = [tableAdmin]()
    
    var locationManager = CLLocationManager()
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
 
    
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
    
    
    
    
    // MARK: TEST LOCATION AND ONBOARDING
    
    
    
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
        
        let userLocation = locations.first
        
        if userLocation != nil {
            
            // We have a location
            // Stop requesting location after we get it once (if we need it once)
            
            locationManager.stopUpdatingLocation()
            
             
        }
        
    }

    
    
}


