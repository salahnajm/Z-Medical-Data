//
//  DiagnosisView.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/9/22.
//

import SwiftUI

struct DiagnosisView: View {
    
   
    
    @State var genderPicker=0
    @State var agePicker:Int
    @State var durationOfSymptoms:Int
    
    @State private var didTap1:Bool = false
    @State private var didTap2:Bool = false
    @State private var didTap3:Bool = false
    
    @State var pickSymptomsSheet:Bool = false
    
    var body: some View {
        GeometryReader { geo in
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Diagnose Me")
                .font(Font.pageTitle)
                .bold()
                .padding(.bottom, 30)
                
            
            VStack(alignment: .leading) {
                
                // Select Gender
                Text("Select gender")
                    .bold()
               
                HStack {
                Button {
                    //Button code here
                    self.didTap1 = true
                    self.didTap2 = false
                    self.didTap3 = false
                    
                } label: {
                    // Image
        BoxButtonZM(label: "Female")
                        .foregroundColor(!didTap1 ? Color("icons-input"): Color("bubble-secondary"))
                        .frame(width: geo.size.width/4, height: geo.size.width/4)
                        .font(Font.title)
                }
                    Spacer()
                Button {
                    //Button code here
                    self.didTap2 = true
                    self.didTap1 = false
                    self.didTap3 = false
                    
                } label: {
                    // Image
                    ZStack{
                    Rectangle()
                                .frame(width: geo.size.width/4, height: geo.size.width/4)
                                .cornerRadius(5)
                                .foregroundColor(!didTap2 ? Color("icons-input"): Color("bubble-secondary"))
                                .shadow(color: .gray, radius: 5, x: 3, y: 3)
                        Text("Male")
                            .font(Font.title)
                            .foregroundColor(.black)
                
                   
                    
                    }
                }
                Spacer()
                Button {
                    //Button code here
                    self.didTap3 = true
                    self.didTap1 = false
                    self.didTap2 = false
                    
                } label: {
                    // Image
                   
                    
                    ZStack{
                        Rectangle()
                            .frame(width: geo.size.width/4, height: geo.size.width/4)
                            .cornerRadius(5)
                            .foregroundColor(!didTap3 ? Color("icons-input"): Color("bubble-secondary"))
                            .shadow(color: .gray, radius: 5, x: 3, y: 3)
                        Text("Other")
                                .font(Font.title)
                                .foregroundColor(.black)
                    
                    }
                }
            

                }
                .padding(.bottom, 30)
                
                // Select Age
                    Text("Select age")
                        .bold()
                    Picker("Age", selection: $agePicker){
                  
                        Text("10-20").tag(0)
            
                        Text("20-50").tag(1)
                        Text("Above 50").tag(2)
                        
                    }.frame(height: 30)
                    .pickerStyle(SegmentedPickerStyle())
                    .shadow(color: .gray, radius: 5, x: 3, y: 3)
                  //  .scaledToFit()
                    .padding(.horizontal)
                    .padding(.bottom, 30)
                    
                // Enter Main Symptom
                
                Text("What are your symptoms?")
                    .bold()
    
                Button {
                    //Action
                    pickSymptomsSheet = true
                } label: {
                    ButtonZM(buttonText: "Symptoms")
                }.sheet(isPresented: $pickSymptomsSheet) {
                    SymptomsPickerView()
                } .padding(.bottom, 30)
                
                // Duration of symptoms
                
                Text("Duration of Symptoms")
                        .bold()
                    Picker("Age", selection: $durationOfSymptoms){
                  
                        Text("< 1 week").tag(0)
            
                        Text("2-4 weeks").tag(1)
                        Text("> 4 weeks").tag(2)
                        
                    }.frame(height: 30)
                    .pickerStyle(SegmentedPickerStyle())
                    .shadow(color: .gray, radius: 5, x: 3, y: 3)
                  //  .scaledToFit()
                    .padding(.horizontal)
                    .padding(.bottom, 30)
                    
               
                
                Spacer()
                
                // Button to execute diagnosis
                Button {
                    //Action
                } label: {
                    ButtonZM(buttonText: "Diagnose me")
                }
            }
            
          
       
        }
            .padding()
            .padding(.bottom, 60)
    }
    }
    
}


struct DiagnosisView_Previews: PreviewProvider {
    static var previews: some View {
        DiagnosisView(agePicker: 1, durationOfSymptoms: 1)
    }
}
