//
//  NewsView.swift
//  Medical App
//
//  Created by Salah Najm on 9/9/22.
//

import SwiftUI

struct NewsView: View {
    
    @EnvironmentObject var model:ZeusModel
    
    var body: some View {
       
        ScrollView{
        LazyVStack{
            Text("Medical Articles")
                .font(Font.largeTitle)
            Text("Medical images")
                .font(Font.title2)
            
            Image("sweet")
                .resizable()
                .frame(width: 78, height: 78)
                .scaledToFill()
                .clipped()
           Text(" When people try to cut sugar out of their diets, for reasons such as trying to lose weight or trying to control their blood sugar, they may turn to artificial sweeteners. Artificial sweeteners have been around for more than 100 years. Saccharin, for example, which is found in the sugar substitute Sweet’N Low, was first discoveredTrusted Source in 1879. Since then, researchers have discovered numerous other artificial sweeteners, including sucralose, aspartame, stevia, and xylitol. There has almost always been controversy surrounding artificial sweeteners. As the Harvard School of Public Health notes, concerns include the development of type 2 diabetes and weight gain but the evidence is varied and inconclusive.")
           
            
            }
        }.padding(.horizontal)

        }
    
}



struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
