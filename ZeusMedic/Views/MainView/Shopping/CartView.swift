//
//  CartView.swift
//  Medical App
//
//  Created by Salah Najm on 10/5/22.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var model:ZeusModel
    
    var body: some View {
 
            if model.orders.count == 0 {
                VStack{
                    Spacer()
                    Text("Your cart is empty")
                        .font(Font.titleText)
                        .padding()
                    Text("Let's go shopping!")
                        .font(Font.titleText)
                        .padding()
                    Spacer()
                }
            } else{

                ScrollView {
                
                Text("Shopping Cart")
                    .font(Font.pageTitle)
                    .padding()
                
                ForEach(model.orders) { order in
                    
                    HStack {
                        VStack{
                        ProductCardView(image: Image(order.image ?? ""), size: 220, title: order.title ?? "", price: 0, rating: 0)
                            Text("$ \(String(order.price ?? 0))")
                                .font(Font.titleText)
                        }
                       
                        Spacer()
                        
                        VStack{
                        
                            //    Counter
                            HStack {
                                //                        Minus Button
                                Button(action: {
                                    
                               model.subtractToCartItem(product: order)
                                    model.calculateTotalPrice()
                                    
                                }) {
                                    Image(systemName: "minus")
                                        .padding(.all, 8)
                                    
                                }
                                .frame(width: 30, height: 30)
                                .overlay(RoundedCorner(radius: 50).stroke())
                                .foregroundColor(.black)
                                
                                Text(String(order.numberOfItems ?? 0))
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .padding(.horizontal, 8)
                                
                                //                        Plus Button
                                Button(action: {
                                    
                                    model.addToCartItem(product: order)
                                    model.calculateTotalPrice()
                                    
                                }) {
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                        .padding(.all, 8)
                                        .background(Color("Primary"))
                                        .clipShape(Circle())
                                }
                            }
                            
                  Text("Number of Items")
                                .font(Font.bodyParagraph)
                           
                        }
                   }
                    Divider()
                }
                }
            Spacer()
            
            VStack{
            
                Text("Total:  $\(String(format: "%.2f", model.totalPrice))")
                    .font(Font.largeTitle)
                
                Button {
                    // TODO: complete purchase
                   
                    
                } label: {
                    ButtonZM(label: "Buy Now")
                }.padding()
            }
       
    }
}
}

