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
    @Published var selectedSymptoms = Set<String>()
    @Published var selectedSymptomsFromPicker = Set<String>()
    
    @Published var totalPrice:Double = 0
    
    @Published var categories2 = Set<String>()
    @Published var selectedCategory: String?
    
    @Published var userLocation:CLLocation?
    
    @Published var doctors = [Zeus]()
    @Published var tableZeus = [tableAdmin]()
    @Published var conditions = [Conditions]()
    @Published var shopping = [shoppingItems]()
    
    @Published var orders = [cartItems]()
    
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
        self.conditions = service.getLocalData3()
        self.shopping = service.getLocalData4()
        
        //     self.categories2 = Set(self.tableZeus.map { r in return r.categories})
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
    
    //TODO: calculator to score diagnosis results
    
    func scoreDiagnosis() {
        
            for cond in conditions {
            
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
  
    var specialtyConvertedToString = [
        
        "a1" : "Aesthetics",
        "a2" : "Allergy",
        "a4" : "Alternative Medicine",
        "a5" : "Anesthesia",
        "a6" : "Audiologist",
        "a7" : "Behavior Analyst",
        "a9" : "Cardiac",
        "a10" : "Cardiothoracic Surgeons",
        "a11" : "Chiropractice",
        "a12" : "Clinics",
        "a13" : "Crowns & Bridgework",
        "a14" : "Dermatology",
        "a16" : "Dietitian",
        "a17" : "Durable Medical Equipment",
        "a18" : "Emergency",
        "a20" : "Otolaryngology",
        "a21" : "Family Medicine",
        "a22" : "Gastroenterology",
        "a23" : "General Medicine",
        "a25" : "Geriatric Medicine",
        "a26" : "Hair Loss",
        "a27" : "Hematology and Oncology",
        "a29" : "Hospital",
        "a30" : "Hyperbaric Medicine",
        "a31" : "Diagnostic Medicine",
        "a33" : "Laboratory",
        "a34" : "Laser Hair Removal",
        "a36" : "Massage",
        "a38" : "Medical Center",
        "a39" : "Medical Fitness",
        "a40" : "Medical Equipment",
        "a41" : "Medical Spa",
        "a42" : "Neonatal-Perinatal Medicine",
        "a43" : "Nephrology",
        "a44" : "Neurological Surgery",
        "a45" : "Neurology (parkinson)",
        "a46" : "Nurse Practitioner",
        "a47" : "Nutrition",
        "a48" : "OB-GYN",
        "a49" : "Occupational Medicine",
        "a50" : "Eye Doctor",
        "a51" : "Optometry",
        "a52" : "Hearing and Vision ",
        "a53" : "Oral & Maxillofacial Surgery",
        "a54" : "Orthopedics",
        "a56" : "Osteopathic",
        "a57" : "Chronic Fatigue / Low Energy",
        "a58" : "Palliative Medicine",
        "a59" : "Pathology",
        "a60" : "Pediatric Dentist",
        "a61" : "Pediatric Care",
        "a62" : "Perinatology",
        "a63" : "Pharmacy",
        "a64" : "Physical Therapy",
        "a65" : "Physician",
        "a66" : "Physician Assistant",
        "a67" : "Plastic Surgery",
        "a68" : "Podiatry",
        "a70" : "Primary Care Doctor",
        "a71" : "Prosthetics Service",
        "a72" : "Psychiatry",
        "a73" : "Asthma, Allergy, lung, respiratory ",
        "a74" : "Radiation Oncology",
        "a75" : "Radiology",
        "a76" : "Rehab & Sports Medicine",
        "a77" : "Respiratory ",
        "a78" : "Autoimmune Diseases",
        "a80" : "Sleep Medicine",
        "a81" : "Cosmetics & Beauty Supply",
        "a82" : "Speech Pathology",
        "a83" : "Spine Surgeon",
        "a84" : "Bariatric Surgeon",
        "a85" : "Medical Surgical Unit",
        "a86" : "Surgical Oncology",
        "a87" : "Therapist",
        "a88" : "Urgent Care",
        "a90" : "Urological Surgery",
        "a91" : "Vascular ",
        "a92" : "Womens Health",
        "a93" : "Wound & Skin Care",
        "a94" : "Yoga",
        "a95" : "Skin Care",
        "a97" : "Home Health",
        "a96" : "Beauty"
    ]
    
    func createAnArray(selectedCatZM :String) -> [String]  {
        
        if selectedCatZM == "Aesthetics, hair, spa,skin" {
            return ["a1", "a14", "a26", "a34", "a36", "a41", "a67", "a81", "a93", "a94", "a95", "a96"]
        }
        else if selectedCatZM == "Hearing, vision, ENT" {
            return ["a1", "a14", "a26", "a34", "a36", "a41", "a67", "a81", "a93", "a94", "a95", "a96"]
        }
        else if selectedCatZM == "Diabetes, nutrition, dietician" {
            return ["a16", "a47"]
        }
        else if selectedCatZM == "Fitness, rehab, sports, physical therapy" {
            return ["a39", "a49", "a64", "a71", "a76", "a82"]
        }
        else if selectedCatZM == "Medical Equipment" {
            return ["a17"]
        }
        else if selectedCatZM == "Pharmacies" {
            return ["a63"]
        }
        else if selectedCatZM == "Alternative Medicine" {
            return ["a4", "a11"]
        }
        else if selectedCatZM == "Osteopathic" {
            return ["a56"]
        }
        else if selectedCatZM == "Clinics" {
            return ["a12"]
        }
        else if selectedCatZM == "Hospital, medical center" {
            return ["a29", "a38", "a85", "a97"]
        }
        else if selectedCatZM == "Emergency" {
            return ["a18"]
        }
        else if selectedCatZM == "Imaging, lab" {
            return ["a31", "a33", "a75"]
        }
        else if selectedCatZM == "Urgent Care" {
            return ["a88"]
        }
        else if selectedCatZM == "General Medicine" {
            return ["a21", "a23", "a25", "a30", "a46", "a57", "a65", "a66", "a68", "a70", "a78", "a80", "a87"]
        }
        else if selectedCatZM == "Allergy, lung, respiratory" {
            return ["a2", "a73", "a77"]
        }
        else if selectedCatZM == "Women's health, OB, GYN" {
            return ["a48", "a62", "a42", "a92"]
        }
        else if selectedCatZM == "Psychiatry and Behavioral health" {
            return ["a7", "a72"]
        }
        else if selectedCatZM == "Palliative Medicine" {
            return ["a58"]
        }
        else if selectedCatZM == "Pathology" {
            return ["a59"]
        }
        else if selectedCatZM == "Pediatric" {
            return ["a61"]
        }
        else if selectedCatZM == "Nephrologist" {
            return ["a43"]
        }
        else if selectedCatZM == "Neurologic, spine" {
            return ["a44", "a45", "a83"]
        }
        else if selectedCatZM == "Orthopedics" {
            return ["a54"]
        }
        else if selectedCatZM == "Hematologic Oncology" {
            return ["a27", "a74", "a86"]
        }
        else if selectedCatZM == "Gastroenterology"  {
            return ["a22"]
        }
        else if selectedCatZM ==  "Cardiac" {
            return ["a9", "a10"]
        }
        else if selectedCatZM ==  "Dental" {
            return ["a13", "a60"]
            
        } else if selectedCatZM ==  "Surgery" {
            return ["a5", "a84", "a90", "a91"]
        }
        return []
    }
    
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

/*
 static let fitness =    Bookmark(name:"Fitness, rehab, sports, physical therapy")
 
 //Medical equipment and pharmacies
 static let equipment =    Bookmark(name:"Medical Equipment")
 static let pharmacies =    Bookmark(name:"Pharmacies")
 
 //Dental
 static let dental =    Bookmark(name:"Dental")
 
 //Alternative
 static let alternative =    Bookmark(name:"Alternative Medicine")
 static let osteopathic =    Bookmark(name:"Osteopathic")
 
 //Medical Help
 static let clinics =    Bookmark(name:"Clinics")
 static let hospital =    Bookmark(name:"Hospital, medical center")
 static let emergency =    Bookmark(name:"Emergency")
 static let imaging =    Bookmark(name:"Imaging, lab")
 static let urgent =    Bookmark(name:"Urgent Care")
 
 //Specialty
 static let generalMedicine = Bookmark(name:"General Medicine")
 static let allergy = Bookmark(name:"Allergy, lung, respiratory")
 static let surgery = Bookmark(name:"Surgery")
 static let women = Bookmark(name:"Women's health, OB, GYN")
 static let psychiatry = Bookmark(name:"Psychiatry and Behavioral health")
 static let palliative = Bookmark(name:"Palliative Medicine")
 static let pathology = Bookmark(name:"Pathology")
 static let pediatric = Bookmark(name:"Pediatric")
 static let nephrology = Bookmark(name:"Nephrologist")
 static let neurology = Bookmark(name:"Neurologic, spine")
 static let orthopedics = Bookmark(name:"Orthopedics")
 static let hematology = Bookmark(name:"Hematologic Oncology")
 static let gastreoenterology = Bookmark(name:"Gastroenterology")
 static let cardiac = Bookmark(name:"Cardiac")
 
 */




