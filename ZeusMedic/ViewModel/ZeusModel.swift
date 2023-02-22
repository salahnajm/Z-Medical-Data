//
//  ZeusModel.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/17/22.
//

import Foundation
import MapKit

class ZeusModel:  NSObject, CLLocationManagerDelegate, ObservableObject {
    // Set garantees unique values
      
    //Yelp.
    //Create an array of categories once we retreive the data from Yelp
    @Published var businessCategories = Set<String>()
    @Published var sights = [Business]()
    //Yelp data into restaurants and sights?
    @Published var restaurants = [Business]()
       
    //Location
    var locationManager = CLLocationManager()
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
    @Published var userLocation:CLLocation?
    // Set myLocation as a CLLocation
    var myLocation: CLLocation!
    
    //Shopping
    @Published var orders = [cartItems]()
    @Published var shopping = [shoppingItems]()
    @Published var totalPrice:Double = 0
    
    //Diagnosis
    @Published var conditions = [Conditions]()
    @Published var selectedSymptoms = Set<String>()
    @Published var selectedSymptomsFromPicker = Set<String>()
    
    @Published var selectedCategory: String?
  
    
    override init() {
        super.init()
        
        // Set contentmodel as delegate of location manager
        locationManager.delegate = self
        
        let service = DataService()
        
        self.conditions = service.getLocalData3()
        self.shopping = service.getLocalData4()
      
    }
    
    func requestGeolocationPermission() {
        
        locationManager.requestWhenInUseAuthorization()
    }
    
    // MARK: - Location
    //Manager Delegate Methods
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
            
            getBusinesses(category: Constants.restaurantsKey, location: userLocation!)
            //Need two calls. for the offset of 50 (so first call gets first 50, second call gets next 50 businesses)
            getBusinesses2(category: Constants.restaurantsKey, location: userLocation!)
            
            let location = locations[locations.count - 1]
            self.myLocation = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            

            // Stop requesting location after we get it once (if we need it once)
            locationManager.stopUpdatingLocation()
        }
    }
    
    // MARK: - Yelp Model
    
    func getBusinesses(category: String, location:CLLocation) {
        
        // Create URL
        var urlComponents = URLComponents(string: Constants.apiUrl)
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "limit", value: Constants.value ),
           // URLQueryItem(name: "offset", value: "250" )
        ]
        // Create URL request
        let url = urlComponents?.url
        
        if let url = url {
            
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            
            // Customize request
            request.httpMethod = "GET"
            request.addValue("Bearer \(Constants.apiKey)", forHTTPHeaderField: "Authorization")
            
            // Get URL session
            let session = URLSession.shared
            
            // Create data task
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                if error == nil && data != nil {
                    
                    // Start data task
                    do {
                        // parse JSON
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(BusinessSearch.self, from: data!)
                        
                        // Sort businesses. So we have to create an array to be able to sort the data
                        var businesses = result.businesses
                        businesses.sort { (b1, b2) -> Bool in
                            return b1.distance ?? 0 < b2.distance ?? 0
                        }
                        
                        // Call function to get image data here
                        for b in businesses {
                            b.getImageData()
                            
                            
                            DispatchQueue.main.async {
                            // get all the alias names from the business categories
                            for c in b.categories! {
                                if c.title != "" {
                                        self.businessCategories.insert(c.title!)

                                    }
                                }
                            }
                        }
                       
                        // When assigning a published property from a background thread, should always dispatch to main queue
                        DispatchQueue.main.async {
                            
                         //self.restaurants = businesses
                            self.restaurants.append(contentsOf: businesses)
                        }
                    }
                    catch {
                        print(error)
                    }
                }
            }
            
            dataTask.resume()
        }
    }
    
    func getBusinesses2(category: String, location:CLLocation) {
        
        // Create URL
        var urlComponents = URLComponents(string: Constants.apiUrl)
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "limit", value: Constants.value ),
            URLQueryItem(name: "offset", value: "50" )
        ]
        // Create URL request
        let url = urlComponents?.url
        
        if let url = url {
            
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            
            // Customize request
            request.httpMethod = "GET"
            request.addValue("Bearer \(Constants.apiKey)", forHTTPHeaderField: "Authorization")
            
            // Get URL session
            let session = URLSession.shared
            
            // Create data task
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                if error == nil && data != nil {
                    
                    // Start data task
                    do {
                        // parse JSON
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(BusinessSearch.self, from: data!)
                        
                        // Sort businesses. So we have to create an array to be able to sort the data
                        var businesses = result.businesses
                        businesses.sort { (b1, b2) -> Bool in
                            return b1.distance ?? 0 < b2.distance ?? 0
                        }
                        
                        // Call function to get image data here
                        for b in businesses {
                            b.getImageData()
                            
                            
                            DispatchQueue.main.async {
                            // get all the alias names from the business categories
                            for c in b.categories! {
                                if c.title != "" {
                                        self.businessCategories.insert(c.title!)

                                    }
                                }
                            }
                        }
                       
                        // When assigning a published property from a background thread, should always dispatch to main queue
                        DispatchQueue.main.async {
                            
                            self.restaurants.append(contentsOf: businesses)
                    
                        }
                    }
                    catch {
                        print(error)
                    }
                }
            }
            
            dataTask.resume()
        }
    }
    
    //MARK: - Diagnosis
    
    //calculator to score diagnosis results
    
    func scoreDiagnosis() {
        //Each condition in JSON file has a list of symptoms with a score value for each symptom. Here we add the value of each symptom if it is present in the condition and gives a final score.
        
        for cond in conditions {
            
            //Need to set other than nil
            cond.conditionScore = 1
            
            for sympt in self.selectedSymptoms {
                
                if sympt.contains("Male") { cond.conditionScore! += cond.male ?? 0}
                if sympt.contains("Female") { cond.conditionScore! += cond.female ?? 0}
                if sympt.contains("1week") { cond.conditionScore! += cond.duration1 ?? 0}
                if sympt.contains("2weeks") { cond.conditionScore! += cond.duration2 ?? 0}
                if sympt.contains("4weeks") { cond.conditionScore! += cond.duration3 ?? 0}
                if sympt.contains("Weight Loss") { cond.conditionScore! += cond.weightLoss ?? 0}
                if sympt.contains("Night Sweats") { cond.conditionScore! += cond.nightSweats ?? 0}
                if sympt.contains("Fatigue") { cond.conditionScore! += cond.fatigue ?? 0}
                if sympt.contains("No Appetite") { cond.conditionScore! += cond.noAppetite ?? 0}
                if sympt.contains("Fever") { cond.conditionScore! += cond.fever ?? 0}
                if sympt.contains("Chills") { cond.conditionScore! += cond.chills ?? 0}
                if sympt.contains("Visual Changes") { cond.conditionScore! += cond.visualChanges ?? 0}
                if sympt.contains("Eye Pain") { cond.conditionScore! += cond.eyePain ?? 0}
                if sympt.contains("Double Vision") { cond.conditionScore! += cond.doubleVision ?? 0}
                if sympt.contains("Runny Nose") { cond.conditionScore! += cond.runnyNose ?? 0}
                if sympt.contains("Nose Bleed") { cond.conditionScore! += cond.noseBleed ?? 0}
                if sympt.contains("Sinus Pain") { cond.conditionScore! += cond.sinusPain ?? 0}
                if sympt.contains("Stuffy Ears") { cond.conditionScore! += cond.stuffyEars ?? 0}
                if sympt.contains("Ringing in Ears") { cond.conditionScore! += cond.ringingInEars ?? 0}
                if sympt.contains("Sore Throat") { cond.conditionScore! += cond.soreThroat ?? 0}
                if sympt.contains("Pain with Swallowing") { cond.conditionScore! += cond.painWithSwallowing ?? 0}
                if sympt.contains("Bleeding Gums") { cond.conditionScore! += cond.bleedingGums ?? 0}
                if sympt.contains("Chest Pain") { cond.conditionScore! += cond.chestPain ?? 0}
                if sympt.contains("Shortness of Breath") { cond.conditionScore! += cond.shortnessOfBreath ?? 0}
                if sympt.contains("Exercise Interolerance") { cond.conditionScore! += cond.exerciseIntolerance ?? 0}
                if sympt.contains("Can't Sleep Flat") { cond.conditionScore! += cond.cantSleep ?? 0}
                if sympt.contains("Swelling in Ankles") { cond.conditionScore! += cond.swellingInAnkles ?? 0}
                if sympt.contains("Palpitations") { cond.conditionScore! += cond.palpitations ?? 0}
                if sympt.contains("Cough") { cond.conditionScore! += cond.cough ?? 0}
                if sympt.contains("Sputum") { cond.conditionScore! += cond.sputum ?? 0}
                if sympt.contains("Coughing Blood") { cond.conditionScore! += cond.coughingBlood ?? 0}
                if sympt.contains("Wheezing") { cond.conditionScore! += cond.wheezing ?? 0}
                if sympt.contains("Blood in Stools") { cond.conditionScore! += cond.bloodInStools ?? 0}
                if sympt.contains("Cant eat") { cond.conditionScore! += cond.cantEat ?? 0}
                if sympt.contains("Vomiting") { cond.conditionScore! += cond.vomiting ?? 0}
                if sympt.contains("Bloating") { cond.conditionScore! += cond.bloating ?? 0}
                if sympt.contains("Nausea") { cond.conditionScore! += cond.nausea ?? 0}
                if sympt.contains("Cramping") { cond.conditionScore! += cond.cramping ?? 0}
                if sympt.contains("Constipation") { cond.conditionScore! += cond.constipation ?? 0}
                if sympt.contains("Black stool") { cond.conditionScore! += cond.blackStools ?? 0}
                if sympt.contains("Diarrhea") { cond.conditionScore! += cond.diarrhea ?? 0}
                if sympt.contains("Vomiting blood") { cond.conditionScore! += cond.vomiting ?? 0}
                if sympt.contains("Indigestion") { cond.conditionScore! += cond.indigestion ?? 0}
                if sympt.contains("Difficulty Swallowing") { cond.conditionScore! += cond.difficultySwallowing ?? 0}
                if sympt.contains("Abdominal pain") { cond.conditionScore! += cond.abdominalPain ?? 0}
                if sympt.contains("Weight loss") { cond.conditionScore! += cond.weightLoss ?? 0}
            }
            
        }
    }
    
    
    // MARK: - Helper functions
    
    
    //MARK: - Shopping
    
    func calculateTotalPrice() {
        
        totalPrice = 0
        for order in orders {
            self.totalPrice += ( (order.price ?? 0) * (Double(order.numberOfItems ?? 0)) )
        }
        
    }
    
    func addProductToCart(product: shoppingItems ){
        var addNewProduct = true
        for (index, item) in orders.enumerated() {
            if item.id == product.id {
                orders[index].numberOfItems = (orders[index].numberOfItems ?? 0) + 1
                addNewProduct = false
            }
        }
        if addNewProduct {
            orders.append(cartItems(id: product.id, title: product.title, numberOfItems: 1, price: product.price, image: product.image1))
        }
    }
    
    func addToCartItem(product: cartItems ){
        
        for (index, item) in orders.enumerated() {
            if item.id == product.id {
                orders[index].numberOfItems = (orders[index].numberOfItems ?? 0) + 1
            }
        }
        
    }
    
    func subtractToCartItem(product: cartItems ){
        
        for (index, item) in orders.enumerated() {
            
            if item.id == product.id {
                
                if  orders[index].numberOfItems ?? 0 > 1 {
                    orders[index].numberOfItems = (orders[index].numberOfItems ?? 0) - 1
                }
                else if orders[index].numberOfItems ?? 0 == 1 {
                    
                    orders.remove(at: index)
                    
                }
                
            }
        }
        
    }
    
}
