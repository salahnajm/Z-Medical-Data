//
//  businessDetailView.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/17/22.
//

import SwiftUI
import RichText
import MapKit

struct ZeusDetailView: View {
    
    let specialtyConvertedToString = [
        
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
        "a73" : "Asthma",
        "a74" : "Radiation Oncology",
        "a75" : "Radiology",
        "a76" : "Rehab & Sports Medicine",
        "a77" : "Respiratory Therapy",
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
    
    @EnvironmentObject var model:ZeusModel
    var selectedBusiness:tableAdmin
    @State private var selectedSheet = false
    
    var body: some View {
        
        VStack(alignment:.leading) {
            Group{
                Text(selectedBusiness.firstName ?? "")
                    .bold()
                    .font(Font.titleText)
                    .padding(.bottom, 20)
                
                
                // Address Line 1
                if selectedBusiness.addressLine1 != "" {
                    
                    Button {
                        ZeusMapView(selectedMapLat: selectedBusiness.latitude, selectedMapLong: selectedBusiness.longitude)
                        selectedSheet = true
                        
                    } label: {
                        
                        HStack{
                            Image(systemName: "mappin.circle")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .scaledToFill()
                            
                            Text(selectedBusiness.addressLine1 ?? "" )
                                .font(Font.smallText)
                        }
                    }.sheet(isPresented: $selectedSheet, content: {
                        VStack {
                            Text(selectedBusiness.firstName ?? "")
                                .bold()
                                .font(Font.titleText)
                                .padding(20)
                            
                            ZeusMapView(selectedMapLat: selectedBusiness.latitude!, selectedMapLong: selectedBusiness.longitude!, selectedMapTitle: selectedBusiness.firstName)
                            
                        }
                        
                    })
                }
             
                // Phone Number
                if selectedBusiness.phoneNumber != "" {
                    HStack{
                        Image(systemName: "phone.circle")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .scaledToFill()
                        
                        Link(selectedBusiness.phoneNumber!, destination: URL(string: "tel:\(ModelHelpers.sanitizePhoneNumber(phone: selectedBusiness.phoneNumber!))")!)
                            .font(Font.smallText)
                        
                    }
                }
                
                // Email
                if selectedBusiness.email != "" && selectedBusiness.email != "-" {
                    HStack{
                        Image(systemName: "envelope.circle")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .scaledToFill()
                            .font(Font.smallText)
                        Link(destination: URL(string:"mailto:\(selectedBusiness.email ?? "")")!) {
                            Text(selectedBusiness.email ?? "" )
                                .font(Font.smallText)
                        }
              
                    }
                    
                }
                
            }  .padding(.horizontal)
                .foregroundColor(Color("text-primary"))
            
            Divider()

            ScrollView {
                
                Text("Specialty")
                    .font(Font.titleText)
                
                ForEach(selectedBusiness.specialtiesZM2!.indices) {
                    Text(model.specialtyConvertedToString[(selectedBusiness.specialtiesZM2?[$0] ?? "")] ?? "")
                        .font(Font.chatHeading)
                        .bold()
                        .foregroundColor(.purple)
                }
                
            Text("")
                    .padding(.bottom, 15)
                
                if selectedBusiness.education != "" {
                    
                    Text("Education")
                        .font(Font.titleText)
                    Text(selectedBusiness.education!)
                        .font(Font.bodyParagraph)
                        .padding(.bottom, 20)
                        
                }
                
                if selectedBusiness.professionalStatement != "" {
                    
                    Text("About")
                        .font(Font.titleText)
                    Text(selectedBusiness.professionalStatement!)
                        .font(Font.bodyParagraph)
                    
                } else {
                    
                    Text(selectedBusiness.about ?? "")
                    RichText(html: selectedBusiness.about ?? "")
                        .padding(.top, 30)
                        .font(Font.bodyParagraph)
                }
                Spacer()
                
            }
            .padding()
            .navigationBarTitle("Specialty Details", displayMode: .inline)
        }
        
        
    }
}
