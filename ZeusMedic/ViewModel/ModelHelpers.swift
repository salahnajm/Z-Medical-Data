//
//  ModelHelpers.swift
//  Medical App
//
//  Created by Salah Najm on 9/26/22.
//

import Foundation

class ModelHelpers {
    
static func sanitizePhoneNumber(phone:String) -> String {
    
    return phone
        .replacingOccurrences(of: "(", with: "")
        .replacingOccurrences(of: ")", with: "")
        .replacingOccurrences(of: " ", with: "")
        .replacingOccurrences(of: "-", with: "")
        .replacingOccurrences(of: " ", with: "")
        .replacingOccurrences(of: ".", with: "")
    
}
    
}
