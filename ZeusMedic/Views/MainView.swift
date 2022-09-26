//
//  MainView.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/9/22.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var model:ZeusModel
    
    @State private var searchShopping = ""
    
    var body: some View {
        
        NavigationView{
            ZStack {
                Color("background")
                    .ignoresSafeArea(edges: [.top, .bottom])
            
            
            VStack {
            
                
                Spacer()
                
                Text("ZeusMedic")
                    .font(Font.titleText)
                    .bold()
                Image("logoTransparent")
                    .resizable()
                    .frame(height:170)
                    .aspectRatio(1, contentMode: .fill)
                //     .scaledToFit()
                
                Spacer()
                //Text Field
  
                Text("Featured Products")
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
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
