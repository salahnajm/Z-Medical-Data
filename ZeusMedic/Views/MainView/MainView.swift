//
//  MainView.swift
//  Medical App
//
//  Created by Salah Najm on 9/9/22.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var model:ZeusModel
    
    @State private var searchShopping = ""
    
    var body: some View {
  
            ZStack {
                Color("background")
                    .ignoresSafeArea(edges: [.top, .bottom])
    
                VStack {
                    
                    Spacer()
                    
                    Text(Constants.AppTitle)
                        .font(Font.titleText)
                        .bold()
                    
                    Image(systemName: "bolt.heart.fill")
                        .resizable()
                        .frame(width: 170, height:170)
                        .scaledToFit()
                    
                    Spacer()
                   
                    Text(Constants.FeaturedProductsTitle)
                        .font(Font.title2)
                        .padding(.horizontal)
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        
                        HStack (spacing: 10) {
                            ForEach(model.shopping) { items in
                                
                                if items.isFeatured == "TRUE" {
                                    NavigationLink(
                                        
                                        
                                        destination: ShoppingItemDetail(selectedShoppingItem: items),
                                        
                                        label: {
                                            //  Text(items.image1 ?? "")
                                            ProductCardView(image: Image(items.image1 ?? ""), size: 150, title: items.title ?? "", price: items.price ?? 0, rating: items.starRating ?? 0)
                                        })
                                    .navigationBarHidden(true)
                                    
                                    
                                }
                                
                            }
                        }
                        
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: ShoppingListView()) {
                        ButtonZM(label: "Shopping")
                    }
                    .navigationBarHidden(true)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    
                }
            }
       
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
