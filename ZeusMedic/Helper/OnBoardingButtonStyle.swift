//
//  OnBoardingButtonStyle.swift
//  swiftui-chat
//
//  Created by Salah Najm on 9/11/22.
//

import SwiftUI
import Foundation

struct OnBoardingButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        ZStack {
            Rectangle()
                .cornerRadius(4)
                .foregroundColor(Color("button-primary"))
                .frame(height:50)
            configuration.label
                .font(Font.button)
                .foregroundColor(Color("text-button"))
        }
        
    }
    
}
