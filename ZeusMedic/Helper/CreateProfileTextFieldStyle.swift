//
//  CreateProfileTextFieldStyle.swift
//  swiftui-chat
//
//  Created by Salah Najm on 9/11/22.
//

import Foundation
import SwiftUI

struct createProfileTextFieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        
        ZStack{
            Rectangle()
                .foregroundColor(Color("input"))
                .cornerRadius(8)
                .frame(height:46)
            
            configuration
                .font(Font.tabBar)
                .padding()
            
            
        }
    }
    
}
