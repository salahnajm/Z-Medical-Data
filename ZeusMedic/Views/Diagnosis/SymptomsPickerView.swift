//
//  SymptomsPickerView.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/23/22.
//

import SwiftUI

struct SymptomsPickerView: View {
    
    @Binding var gender:String
    
    @EnvironmentObject var diagnosis:DiagnosisModel
    @Environment(\.dismiss) private var dismiss
    
    @State var symptomsResult:[String]?
    
    var body: some View {
        
        
        ScrollView {
            VStack(alignment: .leading){
                
                Text("Select Symptoms")
                    .font(Font.titleText)
                    .padding()
                
                Group{
                    MultiSelectSymptomsPicker(symptomCategoryModel: diagnosis.constitutionalSymptoms, icon:"thermometer")
                    Divider()
                    
                    MultiSelectSymptomsPicker(symptomCategoryModel: diagnosis.heartSymptoms, icon:"heart")
                    Divider()
                }
                
                Group{
                    MultiSelectSymptomsPicker(symptomCategoryModel: diagnosis.LungSymptoms, icon:"lungs")
                    Divider()
                    
                    MultiSelectSymptomsPicker(symptomCategoryModel: diagnosis.gastroentestinalSymptoms, icon:"stomach")
                    Divider()
                }
                
                Group {
                    MultiSelectSymptomsPicker(symptomCategoryModel: diagnosis.eyelSymptoms, icon:"nose")
                    
                    Divider()
                    
                    MultiSelectSymptomsPicker(symptomCategoryModel: diagnosis.earsNoseMouthSymptoms, icon:"ear")
                    Divider()
                }
                
                Group {
                    MultiSelectSymptomsPicker(symptomCategoryModel: diagnosis.genitourinarySymptoms, icon:"staroflife")
                    
                    Divider()
                    
                    if gender == "Female" {
                        MultiSelectSymptomsPicker(symptomCategoryModel: diagnosis.femaleSymptoms, icon:"staroflife.circle")
                        Divider()
                    }
                    
                }
                Group {
                    MultiSelectSymptomsPicker(symptomCategoryModel: diagnosis.musculoskeletalSymptoms, icon:"staroflife")
                    
                    Divider()
                    
                    MultiSelectSymptomsPicker(symptomCategoryModel: diagnosis.skinSymptoms, icon:"staroflife.circle")
                    Divider()
                }
                MultiSelectSymptomsPicker(symptomCategoryModel: diagnosis.neuroSymptoms, icon:"brain.head.profile")
                Divider()
                
                Button {
                    //Action
                    dismiss()

                    
                } label: {
                    ButtonZM(label: "Submit")
                    
                }.padding(.horizontal)
                
            }
            .font(Font.caption)
            
        }
    }
}
