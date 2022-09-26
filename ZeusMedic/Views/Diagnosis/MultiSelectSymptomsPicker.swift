//
//  MultiSelectSymptomsPicker.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/29/22.
//

import SwiftUI

struct MultiSelectSymptomsPicker: View {
    
    
    @EnvironmentObject var diagnosis:DiagnosisModel
    @EnvironmentObject var model:ZeusModel
    
    var symptomCategoryModel = Set<String>()
    var icon:String
    
    var body: some View {
        
        let rows = [GridItem(.fixed(72)), GridItem(.fixed(72)), GridItem(.fixed(72)), GridItem(.fixed(72))]
        
        HStack {
            
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:25, height:30)
                .padding(15)
                .tint(Color("icons-secondary"))
            
            LazyVGrid(columns: rows, spacing: 10) {
                
                ForEach (symptomCategoryModel.sorted(by: <), id: \.self) { item in
                    
                    Button {
                        
                        if model.selectedSymptomsFromPicker.contains(item) {
                            model.selectedSymptomsFromPicker.remove(item)
                        } else {
                            model.selectedSymptomsFromPicker.insert(item)
                        }
                        
                    } label: {
                        BoxButtonZM(label: item)
                            .foregroundColor(!model.selectedSymptomsFromPicker.contains(item) ? Color("icons-input"): Color("bubble-secondary"))
                        
                            .frame(width: 68, height: 60)
                    }
                }
            }
        }
    }
}
