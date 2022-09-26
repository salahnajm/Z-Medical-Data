//
//  DataZM.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/27/22.
//

import Foundation


struct Bookmark: Identifiable, Equatable {
    let id = UUID()
    let name: String
    //let icon: String
    var items: [Bookmark]?

    //Aesthetics, hearing, nutrition
    static let aesthetics = Bookmark(name:"Aesthetics, hair, spa,skin")
    static let hearing =   Bookmark(name:"Hearing, vision, ENT")
    static let diabetes =  Bookmark(name:"Diabetes, nutrition, dietician")
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
    
    // Six groups
    static let astheticsGroup = Bookmark(name: "Asthetics, hearing, vision, nutrition", items: [Bookmark.aesthetics, Bookmark.hearing, Bookmark.diabetes, Bookmark.fitness])
    static let equipmentGroup = Bookmark(name: "Medical equipment and pharmacies", items: [Bookmark.equipment, Bookmark.pharmacies])
    static let dentalGroup = Bookmark(name: "Dental", items: [Bookmark.dental])
    
    static let alternativeGroup = Bookmark(name: "Alternative Medicine", items: [Bookmark.alternative, Bookmark.osteopathic])
    static let medicalHelp = Bookmark(name: "Medical Help", items: [Bookmark.clinics, Bookmark.hospital, Bookmark.emergency, Bookmark.imaging, Bookmark.urgent])
    static let specialtyGroup = Bookmark(name: "Specialties", items: [Bookmark.generalMedicine, Bookmark.allergy, Bookmark.surgery, Bookmark.women, Bookmark.psychiatry, Bookmark.palliative, Bookmark.pathology, Bookmark.pediatric, Bookmark.pediatric, Bookmark.nephrology, Bookmark.neurology, Bookmark.orthopedics, Bookmark.hematology, Bookmark.gastreoenterology, Bookmark.cardiac])
}



/*

"Aesthetics, hair, spa, skin":"b1",
"Hearing, vision, ENT" : "b12",
"Diabetes, nutrition, dietician" : "b7",
"Fitness, rehab, sports, physical therapy" : "b9"])

var equipmentAndPharamciesZM = [
"Medical Equipment" : "b16",
"Pharmacies" : "b24" ]

var dental = ["Dental" : "b6"]

var aleternativeMedicine = [
"Alternative Medicine":"b3",
"Osteopathic" : "b20"]

var clinicsZM = [
"Clinics" : "b5",
"Hospital, medical center" : "b14",
"Emergency" : "b8",
"Imaging, lab" : "b15",
"Urgent Care" : "b27"]


var specialtiesZM = [
"General Medicine" : "b11",
"Allergy, lung, respiratory":"b2",
"Surgery" : "b26",
"Women's health, OB, GYN" : "b28",
"Psychiatry and Behavioral health" : "b25",
"Palliative Medicine" : "b21",
"Pathology" : "b22",
"Pediatric" : "b23",
"Nephrologist" : "b17",
"Neurologic, spine" : "b18",
"Orthopedics" : "b19",
"Hematologic Oncology" : "b13",
"Gastroenterology" : "b10",
"Cardiac" :"b4"]

*/
