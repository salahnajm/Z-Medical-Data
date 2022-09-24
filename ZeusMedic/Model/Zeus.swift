//
//  ZeusModel.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/16/22.
//

import Foundation

class Zeus:Identifiable, Decodable {
    
    var id:Int?
    var provider_id:Int?
    var doctor_id:Int?
    var address_line_1:String?
    var address_line_2:String?
    var country:Int?
    var state:Int?
    var city:Int?
    var zip:String?
    var latitude:Double?
    var longitude:Double?
    var new_file_fee:Double?
    var new_file_time_minutes:Int?
    var old_file_time_minutes:Int?
    var old_file_fee:Double?
    var email:String?
    var contact:String?
    var image1:String?
    var professional_fatement:String?
    var about:String?
    
}
