//
//  ButtonZM.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/9/22.
//

import SwiftUI

struct ButtonZM: View {
    
    var label:String
    
    var body: some View {
        ZStack(alignment:.center){
 
        Rectangle()
            .foregroundColor(.white)
            .frame(height:40)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 4, x: 2, y: 3)
        Text(label)
            .bold()
            .padding(.horizontal, 5)
            .foregroundColor(.black)
            .font(Font.chatHeading)
           
        }
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        ButtonZM(label: "Press Me")
    }
}
