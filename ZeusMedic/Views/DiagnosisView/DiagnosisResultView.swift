//
//  DiagnosisResultView.swift
//  Medical App
//
//  Created by Salah Najm on 9/30/22.
//

import SwiftUI

struct DiagnosisResultView: View {
    
    @EnvironmentObject var model:ZeusModel
    
    var body: some View {
    
        ScrollView {
            
            Text("Possible Conditions")
                     .font(Font.largeTitle)
                     .bold()
                     .padding()
            Divider()
            
            ForEach(model.conditions.sorted(by: >), id: \.id ) { r in
            
            VStack {
                HStack{
                    Text(r.condition ?? "")
                    .font(Font.title2)
                    .padding()
                 Spacer()
                    Text("Score: \(r.conditionScore ?? 0)")
                }
                Text(r.description ?? "")
                
                }
            .padding(.horizontal)
                
            }
            
        }
             
    }
}

//struct DiagnosisResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        DiagnosisResultView()
//    }
//}
