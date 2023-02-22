//
//  MyHealthView.swift
//  Medical App
//
//  Created by Salah Najm on 2/22/23.
//

import SwiftUI

struct MyHealthView: View {
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
          
            HStack {
                Spacer()
                Text(Constants.MyHealthViewTitle)
                    .font(.title)
                Image(systemName: "bolt.heart.fill")
                    .resizable()
                    .frame(width:30, height:30)
                    .scaledToFit()
                    .foregroundColor(.red)
                Spacer()
            }
            
            HealthKitStepView()
              
            Text("Age")
                .padding(.bottom, 30)
            
            Text("Health screening")
            
            Spacer()
            
              
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}
