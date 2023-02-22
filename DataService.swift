//
//  DataService.swift
//  RecipeApp2.0
//
//  Created by Salah Najm on 8/23/22.
//

import Foundation
import SwiftUI
import CoreLocation
import MapKit

class DataService {
    
    @Published var codeText = NSAttributedString()

    
    // Do I need the styleData? I might be able to delete it
    var styleData: Data?
    var myLocation:CLLocation?
    
    func getLocalData3() -> [Conditions] {
        
        let pathString3 = Bundle.main.path(forResource: "conditions", ofType: "json")
        if pathString3 != nil {
            let url2 = URL(fileURLWithPath: pathString3!)
            
            do{
                let data3 = try Data(contentsOf: url2)
                let decoder3 = JSONDecoder()
                do{
                    let ZeusData3 = try decoder3.decode([Conditions].self, from: data3)
                    
                    // I have the data here
                   
                    return ZeusData3
                    
                }catch {
                    print("could not decode Conditions data")
                    print(error)
                }
            }
            catch {
                print("could not get Conditions data file3")
            }
        }
        
        return [Conditions]()
    }
    
    func getLocalData4() -> [shoppingItems] {
        
        let pathString4 = Bundle.main.path(forResource: "shoppingData", ofType: "json")
        if pathString4 != nil {
            let url4 = URL(fileURLWithPath: pathString4!)
            
            do{
                let data4 = try Data(contentsOf: url4)
                let decoder4 = JSONDecoder()
                do{
                    let ZeusData4 = try decoder4.decode([shoppingItems].self, from: data4)
                    
                    // I have the data here
                   
                    return ZeusData4
                    
                }catch {
                    print("could not decode Shopping Items data")
                    print(error)
                }
            }
            catch {
                print("could not get Shopping Items data file4")
            }
        }
        
        return [shoppingItems]()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            //     locationManager.stopUpdatingLocation()
        }
        self.myLocation = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    }
    
   
}
