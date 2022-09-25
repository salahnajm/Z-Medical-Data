//
//  ButtonZM.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/9/22.
//

import SwiftUI

struct ButtonZM: View {
    
    var buttonText:String
    
    var body: some View {
        ZStack(alignment:.center){
 
        Rectangle()
            .foregroundColor(.white)
            .frame(height:45)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 5, x: 3, y: 3)
        Text(buttonText)
            .padding(.horizontal, 5)
            .foregroundColor(.black)
            .font(.title)
        }
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        ButtonZM(buttonText: "Press Me")
    }
}
