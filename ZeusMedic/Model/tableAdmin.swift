//
//  tableAdmin.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/17/22.
//

import Foundation
import CoreLocation
import MapKit

class tableAdmin: Decodable, Identifiable, ObservableObject {
  
    var location:CLLocation{
        return CLLocation(latitude: self.latitude ?? 0, longitude: self.longitude ?? 0)
    }

    var distance:CLLocationDistance?
    var specialtiesZM:Set<String>?
    var specialtiesZM2:[String]?
    
    var id:Int?
    var providerId:Int?
//    var fee:Int?
    var firstName:String?
    var lastName:String?
  //  var nameAr:String?
  //  var profile:String?
  //  var userName:String?
    var email:String?
//  var password:String?
//    var roleId:Int?
    var phoneNumber:String?
//    var empStartDate:String?
//    var empEndDate:String?
//    var posPin:Int?
//    var Exempt:String?
//    var adminPermissionSet:String?
//    var milageReimb:Int?
//    var providerAdminRole:String?
//    var isAdmin:Int?
//    var status:Int?
 //   var rememberToken:String?
 //   var token:String?
    
 //   var supportEmail:String?
    var LanguageSpoken:String?
    var professionalMemberships:String?
    var education:String?
  //  var categories:String
  //  var hospitalDoctorCategory:String?
 //   var insurances:String?
 //   var workingDays:Int?
    var addressLine1:String?
//    var addressLine2:String?
//    var country:Int?
//   var state:Int?
//    var city:Int?
//    var zip:Int?
    var about:String?
//    var aboutAr:String?
    var latitude: Double?
    var longitude: Double?
    var image1:String?
    var image2:String?
    var image3:String?
    var image4:String?
    var image5:String?
    var logo:String?
    var icon:String?
//    var cust:Int?
    var professionalStatement:String?
  //  var hospitals:String?

  //  "doctors": null,
    
 //   var subscriptionStart:String?
 //   var subscriptionEnd:String?
    var website:String?
   // var specialties:String?
  //  var features:Int?
 //   var isAppointment:Int?
    var newFileTimeMinutes:Int?
    var newFileFee:Double?
    var oldFileTimeMinutes:Int?
    var oldFileFee:Int?

    //    var bookingCancellationTime
    
    var workingHours:String?
  //  var type:Int?
  //  var viewType:Int?
 // var createdBy:Int?
 //  var updatedBy:Int?
 //   var createdAt:String?
   // var updatedAt:String?
  //  var doctorViewCount:Int?
    var zmCategory0:String?
    var zmCategory1:String?
    var zmCategory2:String?
    var zmCategory3:String?
    var zmCategory4:String?
    var zmCategory5:String?
    var zmCategory6:String?
    var zmCategory7:String?
    var zmCategory8:String?
    var zmCategory9:String?
    var zmCategory10:String?
    var zmCategory11:String?
    var zmCategory12:String?
    var zmCategory13:String?
    var zmCategory14:String?
    var zmCategory15:String?
    var zmCategory16:String?
    var zmCategory17:String?
    var zmCategory18:String?
    var zmCategory19:String?
    var zmCategory20:String?
    var zmCategory21:String?
    var zmCategory22:String?
    var zmCategory23:String?
    var zmCategory24:String?
    var zmCategory25:String?
    var zmCategory26:String?
    var zmCategory27:String?
    var zmCategory28:String?
    var zmCategory29:String?
    var zmCategory30:String?
    var zmCategory31:String?
    var zmCategory32:String?
    var zmCategory33:String?
    
    
}
