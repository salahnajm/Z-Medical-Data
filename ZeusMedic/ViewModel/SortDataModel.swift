//
//  SortDataModel.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/23/22.
//


/*
import Foundation
import MapKit
import CoreLocation

class OrganizationSorter {
    
    var businesses = [tableAdmin]()
    
    

  var memorizedValues = [Int:CLLocationDistance]()

    func shortestDistanceToOrganizationFromLocation(organization:tableAdmin,location:CLLocation) -> CLLocationDistance? {

    let memoizedValue = memorizedValues[organization.id] //Check whether we've done this calculation before, if so return the result from last time
    if memoizedValue != nil {
        return memoizedValue
    }

    //There should probably be some code around here to check
    //that the organization object has at least one location
    //I'm assuming it does to simplify things

    var shortestDistance : CLLocationDistance? = nil
    let locations = organization.addressLine1
    if locations!.count > 0 {
      for coord in locations! {
        let loc = CLLocation(latitude: coord.latitude, longitude: coord.longitude)
        let dist = loc.distanceFromLocation(location)

        if shortestDistance == nil || shortestDistance > dist {
          shortestDistance = dist
        }
      }
    }

    if shortestDistance != nil {
      memorizedValues[organization.id] = shortestDistance
    }

    return shortestDistance
  }
 
 
   var sortedArray = [tableAdmin].sort { (a:tableAdmin, b:tableAdmin) -> Bool in
     let dist1 = self.shortestDistanceToOrganizationFromLocation(a, location: location)
     let dist2 = self.shortestDistanceToOrganizationFromLocation(b, location: location)
     return dist1 < dist2

 //  memorizedValues.removeAll() //reset memorized values in case object is used twice
   return sortedArray
 }
}


 */
    
 

 
