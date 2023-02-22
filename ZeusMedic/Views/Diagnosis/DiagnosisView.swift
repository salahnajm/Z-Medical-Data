//
//  DiagnosisView.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/9/22.
//

import SwiftUI

struct DiagnosisView: View {
    
    @EnvironmentObject var model:ZeusModel
    
    @State var genderPicker:String
    @State var agePicker:String
    @State var durationOfSymptoms:String
    
    @State private var didTap1:Bool = false
    @State private var didTap2:Bool = false
    @State private var didTap3:Bool = false
    
    @State var pickSymptomsSheet:Bool = false
    @State var showDiagnosisResults:Bool = false
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 0) {
                
                Text("Diagnose Me")
                    .font(Font.chatHeading)
                    .bold()
                    .padding(.bottom, 30)
                
                VStack(alignment: .leading) {
                    
                    // Gender Picker
                    Text("Select gender")
                        .bold()
                    
                    Group{
                        HStack {
                            Button {
                                //Button code here
                                self.didTap1 = true
                                self.didTap2 = false
                                self.didTap3 = false
                                
                                if self.didTap1 == true {
                                    genderPicker = "Female"
                                    
                                }
                                
                            } label: {
                                // Image
                                
                                ZStack{
                                    Rectangle()
                                        .frame(width: geo.size.width/4, height: geo.size.width/4)
                                        .cornerRadius(5)
                                        .foregroundColor(!didTap1 ? Color("icons-input"): Color("bubble-secondary"))
                                        .shadow(color: .gray, radius: 5, x: 3, y: 3)
                                    Text("Female")
                                        .font(Font.title)
                                        .foregroundColor(.black)
                                }
                            }
                            Spacer()
                            Button {
                                //Button code here
                                self.didTap2 = true
                                self.didTap1 = false
                                self.didTap3 = false
                                
                                if self.didTap2 == true {
                                    genderPicker = "Male"
                                }
                                
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
                                
                                if self.didTap3 == true {
                                    genderPicker = "Other"
                                }
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
                        
                        // Age Picker
                        Text("Select age")
                            .bold()
                        Picker("Age", selection: $agePicker){
                            Text("10-20").tag("10")
                            Text("20-50").tag("20")
                            Text("Above 50").tag("50")
                            
                        }.frame(height: 30)
                            .pickerStyle(SegmentedPickerStyle())
                            .shadow(color: .gray, radius: 5, x: 3, y: 3)
                        //  .scaledToFit()
                            .padding(.horizontal)
                            .padding(.bottom, 30)
                    }
                    // Enter Symptom
                    
                    Text("What are your symptoms?")
                        .bold()
                    
                    Button {
                        //Action
                        pickSymptomsSheet = true
                    } label: {
                        
                        HStack{
                            ButtonZM(label: "Symptoms")
                            Spacer()
                            Image(systemName: "\(model.selectedSymptomsFromPicker.count).circle")
                                .font(.title2)
                            
                        }
                        
                    }.sheet(isPresented: $pickSymptomsSheet) {
                        SymptomsPickerView(gender:$genderPicker)
                    } .padding(.bottom, 30)
                    
                    // Duration of symptoms
                    
                    Text("Duration of Symptoms")
                        .bold()
                    Picker("Age", selection: $durationOfSymptoms){
                        
                        Text("< 1 week").tag("1week")
                        
                        Text("2-4 weeks").tag("2weeks")
                        Text("> 4 weeks").tag("4weeks")
                        
                    }.frame(height: 30)
                        .pickerStyle(SegmentedPickerStyle())
                        .shadow(color: .gray, radius: 5, x: 3, y: 3)
                        .padding(.horizontal)
                        .padding(.bottom, 30)
                    
                    Spacer()
                    
                    // Button to execute diagnosis
                    
                    if genderPicker.count == 0 || agePicker.count == 0 || durationOfSymptoms.count == 0 || model.selectedSymptomsFromPicker.count == 0 {
                        
                        Text("Pick:\(genderPicker.count == 0 ? " gender" : "")\(agePicker.count == 0 ? " age" : "")\(durationOfSymptoms.count == 0 ? " duration" : "")\(model.selectedSymptomsFromPicker.count == 0 ? " symptoms" : "")")
                            .font(Font.bodyParagraph)
                            .foregroundColor(.red)
                    }
                    
                    Spacer()
                    
                    Button {
                        //Action
                        model.selectedSymptoms.removeAll()
                        model.selectedSymptoms.insert(self.genderPicker)
                        model.selectedSymptoms.insert(self.agePicker)
                        model.selectedSymptoms.insert(self.durationOfSymptoms)
                        model.selectedSymptoms = model.selectedSymptoms.union(model.selectedSymptomsFromPicker)
                        model.scoreDiagnosis()
                        
                        showDiagnosisResults = true
                        
                    } label: {
                        ButtonZM(label: "Diagnose me")
                    }
                    .padding(.bottom)
                    .disabled(genderPicker.count == 0 || agePicker.count == 0 || durationOfSymptoms.count == 0 || model.selectedSymptomsFromPicker.count == 0)
                    .sheet(isPresented: $showDiagnosisResults) {
                        DiagnosisResultView()
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
        DiagnosisView(genderPicker: "Female", agePicker: "10", durationOfSymptoms: "2weeks")
            .environmentObject(ZeusModel())
    }
}
