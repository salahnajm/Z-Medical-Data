//
//  RecipeCategoryView.swift
//  RecipeApp2.0
//
//  Created by Salah Najm on 9/9/22.
//

import SwiftUI

struct ZeusCategoryView: View {
    
    @EnvironmentObject var model: ZeusModel
  //  @Binding var selectedTab:Int
    
    @State private var didTap1:Bool = false
    
    var body: some View {
  
        VStack(alignment:.leading) {
            
            Text("Categories")
                .bold()
                .padding(.leading)
                .font(.largeTitle)
            
            GeometryReader { geo in
                
                ScrollView(showsIndicators: false) {
                    
                    LazyVGrid (columns: [GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20, alignment: .top)], alignment: .center, spacing: 20) {
                        
                   
                        ForEach(Array(model.categories2), id: \.self) { category in
                            
                            Button {
                    //            selectedTab = 2
                                model.selectedCategory = category
                                
                            } label: {
                                
                                BoxButtonZM(label: category)
                                    .foregroundColor(!didTap1 ? Color("icons-input"): Color("bubble-secondary"))
                                    .frame(width: geo.size.width/4, height: geo.size.width/4)
                         
                        }
                        
                    }
                
                    
                }
             
            }
           
            
        }
        .padding(.horizontal)
        
    }
        
}

}
