//
//  SwiftUIView.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/14/22.
//

import Foundation
import SwiftUI

struct TextFieldZM: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        
        ZStack{
            Rectangle()
                .foregroundColor(.white)
               // .cornerRadius(8)
                .frame(height:52)
                .shadow(color: .gray, radius: 3, x: 5, y: 5)
             
            
            configuration
                .padding()
            
            
        }   .padding(.horizontal, 20)
    }
    
}


