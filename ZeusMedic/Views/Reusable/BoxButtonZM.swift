//
//  BoxButtonZM.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/22/22.
//

import SwiftUI

struct BoxButtonZM: View {
    
    var label:String
    
    var body: some View {
        
        
   
            
        ZStack{
        
            Rectangle()
                .cornerRadius(5)
                .shadow(color: .gray, radius: 5, x: 3, y: 3)
            Text(label)
            
                    .foregroundColor(.black)
            
        }
        
    
    }
}

//struct BoxButtonZM_Previews: PreviewProvider {
//    static var previews: some View {
//        BoxButtonZM()
//    }
//}
