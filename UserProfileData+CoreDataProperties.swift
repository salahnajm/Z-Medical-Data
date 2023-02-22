//
//  UserProfileData+CoreDataProperties.swift
//  Medical App
//
//  Created by Salah Najm on 2/22/23.
//
//

import Foundation
import CoreData


extension UserProfileData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserProfileData> {
        return NSFetchRequest<UserProfileData>(entityName: "UserProfileData")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var userAge: Int64
    @NSManaged public var medicalHistory: NSObject?

}

extension UserProfileData : Identifiable {

}
