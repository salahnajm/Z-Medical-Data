//
//  NewsView.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/9/22.
//

import SwiftUI

struct NewsView: View {
    
    @EnvironmentObject var model:ZeusModel
    
    var body: some View {
       
        ScrollView{
        LazyVStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text("Medical Articles")
            Text("Medical images")
            
            ForEach(model.doctors) { item in
                
                Text(item.address_line_1 ?? "")
                Text(item.about ?? "")
            }
        }
        }.padding(.horizontal)
    }
}


struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
