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
    @Published var listings = [tableAdmin]()
    
    // Do I need the styleData? I might be able to delete it
    var styleData: Data?
    var myLocation:CLLocation?
    
    func getLocalData() -> [Zeus] {
        
        let pathString = Bundle.main.path(forResource: "doctors", ofType: "json")
        
        if pathString != nil {
            
            let url = URL(fileURLWithPath: pathString!)
            do{
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                
                do{
                    let ZeusData = try decoder.decode([Zeus].self, from: data)
                    
                    return ZeusData
                    
                }catch {
                    print("could not decode data")
                }
            }
            catch {
                print("could not get data file")
            }
        }
        return [Zeus]()
    }
    
    func getLocalData2() -> [tableAdmin] {
        
        let pathString2 = Bundle.main.path(forResource: "tableAdmin", ofType: "json")
        if pathString2 != nil {
            let url2 = URL(fileURLWithPath: pathString2!)
            
            do{
                let data2 = try Data(contentsOf: url2)
                let decoder2 = JSONDecoder()
                do{
                    let ZeusData2 = try decoder2.decode([tableAdmin].self, from: data2)
                    
                    // I have the data here
                    for c in ZeusData2 {
                       
                        c.specialtiesZM = [c.zmCategory0 ?? "" , c.zmCategory1 ?? "", c.zmCategory2 ?? "", c.zmCategory3 ?? "", c.zmCategory4 ?? "", c.zmCategory5 ?? "", c.zmCategory6 ?? "", c.zmCategory7 ?? "", c.zmCategory8 ?? "", c.zmCategory9 ?? "", c.zmCategory10 ?? "", c.zmCategory11 ?? "", c.zmCategory12 ?? "", c.zmCategory13 ?? "", c.zmCategory14 ?? "", c.zmCategory15 ?? "", c.zmCategory16 ?? "", c.zmCategory17 ?? "", c.zmCategory18 ?? "", c.zmCategory19 ?? "", c.zmCategory20 ?? "", c.zmCategory21 ?? "", c.zmCategory22 ?? "", c.zmCategory23 ?? "", c.zmCategory24 ?? "", c.zmCategory25 ?? "", c.zmCategory26 ?? "", c.zmCategory27 ?? "", c.zmCategory28 ?? "", c.zmCategory29 ?? "", c.zmCategory30 ?? "", c.zmCategory31 ?? "", c.zmCategory32 ?? "", c.zmCategory33 ?? ""]
                        
                        c.specialtiesZM2 = c.specialtiesZM?.filter({ $0 != ""})
                        
                 }
                    return ZeusData2
                    
                }catch {
                    print("could not decode tableAdmin data")
                    print(error)
                }
            }
            catch {
                print("could not get tableAdmin data file2")
            }
        }
        
        // Do I need styeData? Might be ok to delete
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        do{
            let styleData = try Data(contentsOf: styleUrl!)
            self.styleData = styleData
            
        } catch {
            print("Could not parse Style data")
        }
        
        return [tableAdmin]()
    }
    
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
