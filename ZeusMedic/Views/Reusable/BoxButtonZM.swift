//
//  BoxButtonZM.swift
//  Medical App
//
//  Created by Salah Najm on 9/22/22.
//

import SwiftUI

struct BoxButtonZM: View {
    
    var label:String
    
    var body: some View {
        
        ZStack{
            
            Rectangle()
                .frame(height:48)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: 3, y: 3)
                .overlay {
                    Text(label)
                        .foregroundColor(.black)
                        .font(Font.smallText)
                }
        }
    }
}

struct BoxButtonZM_Previews: PreviewProvider {
    static var previews: some View {
        BoxButtonZM(label: "Button")
    }
}
