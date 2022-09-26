//
//  File.swift
//  ZeusMedic
//
//  Created by Salah Najm on 10/5/22.
//

import SwiftUI

struct DescriptionView: View {
    
    var selectedShoppingItem:shoppingItems
    @State var numberOfItemsSelected:Int = 1
    
    var body: some View {
        VStack (alignment: .leading) {
            //                Title
           
            HStack{
            Text(selectedShoppingItem.title ?? "")
                .font(.title)
                .fontWeight(.bold)
            //                Rating
           Spacer()
            StarRating(rating: selectedShoppingItem.starRating ?? 0, maxRating: 5)
                    .frame(width: 100)
            }
            Spacer()
            Text(selectedShoppingItem.description1 ?? "")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text(selectedShoppingItem.description2 ?? "")
                .lineSpacing(8.0)
                .opacity(0.6)
            
            Spacer()
            //                Info
            
            if selectedShoppingItem.options != "" {
                SwiftUI.HStack (alignment: .top) {
                    Text("Options: ")
                        .bold()
                    Text(selectedShoppingItem.options!)
                    }
                    
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    VStack (alignment: .leading) {
                        Text("Treatment")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                        Text("Jati Wood, Canvas, \nAmazing Love")
                            .opacity(0.6)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
            Spacer()
            
            if selectedShoppingItem.colors != "" {
                SwiftUI.HStack (alignment: .top) {
                    Text("Colors: ")
                        .bold()
                    Text(selectedShoppingItem.colors!)
                    }
                    
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                }
        
            //    Counter      
                 
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .offset(x: 0, y: -90.0)
    }
}
