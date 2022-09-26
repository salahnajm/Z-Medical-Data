//
//  MainView.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/9/22.
//

import SwiftUI

struct ShoppingListView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var model:ZeusModel
    
    var body: some View {
        
        //    NavigationView {
        
        let rows = [GridItem(.fixed(180)), GridItem(.fixed(180))]
        
        ScrollView{
            LazyVGrid(columns: rows, spacing: 20) {
                
                ForEach(model.shopping) { shopping in
                    
                    NavigationLink {
                        ShoppingItemDetail(selectedShoppingItem: shopping)
                    } label: {
                        ProductCardView(image: Image(shopping.image1 ?? ""), size: 140, title: shopping.title ?? "", price: shopping.price ?? 0, rating: shopping.starRating ?? 0)
                    }
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
    }
    
}
