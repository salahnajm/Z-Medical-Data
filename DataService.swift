//
//  DataService.swift
//  RecipeApp2.0
//
//  Created by Salah Najm on 8/23/22.
//

import Foundation
import SwiftUI
import CoreLocation

class DataService {

    @Published var codeText = NSAttributedString()
    var styleData: Data?
    
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
                    
                    
                    
                     
                    return ZeusData2
                }catch {
                    print("could not decode data2")
                 
                }
                
            }
            catch {
                print("could not get data file2")
            }
        }
       
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do{
            let styleData = try Data(contentsOf: styleUrl!)
           
            
            self.styleData = styleData
            
        } catch {
            print("Could not parse Style data")
        }
        
        return [tableAdmin]()
        
    } 
    
}
