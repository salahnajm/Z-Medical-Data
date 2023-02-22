//
//  InformationForm.swift
//  Medical App
//
//  Created by Salah Najm on 2/22/23.
//

import SwiftUI

struct InformationForm: View {
    
    @State var firstName:String = ""
    @State var lastName:String = ""
    @State var userAge:Date = Date()
    
    @Binding var isFormViewShowing:Bool
    
    var body: some View {
       
        VStack(alignment: .leading){
            
            Text(Constants.FormTitle)
                .font(Font.title)
                .padding()
                .padding(.bottom, 20)
            
            Text("First Name")
            TextField("First Name", text: $firstName)
               .textFieldStyle(CreateProfileTextFieldStyle())
            
            Text("Lase Name")
            TextField("Last Name", text: $lastName)
                .textFieldStyle(CreateProfileTextFieldStyle())
           
            DatePicker("Date of Bith", selection: $userAge)
            
            Text("Medical History")
           
            Spacer()
            
            Button {
                // Save into Core Data
                
                isFormViewShowing = false
            } label: {
               ButtonZM(label: "Submit")
            }
      
        }
       
        .padding()
    }
}


