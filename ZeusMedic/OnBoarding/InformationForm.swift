//
//  InformationForm.swift
//  ZeusMedic
//
//  Created by Salah Najm on 2/22/23.
//

import SwiftUI

struct InformationForm: View {
    
    @State var firstName:String = "John.."
    @State var lastName:String = "Wood.."
    
    var body: some View {
       
        VStack {
            
            TextField("First Name", text: $firstName)
            TextField("Last Name", text: $lastName)
           
            Text("Age")
            Text("Medical History")
            
            Button {
                // Save into Core Data
            } label: {
               ButtonZM(label: "Submit")
            }

            
        }
        .padding()
    }
}

struct InformationForm_Previews: PreviewProvider {
    static var previews: some View {
        InformationForm()
    }
}
