//
//  TagLineView.swift
//  Medical App
//
//  Created by Salah Najm on 10/5/22.
//

import SwiftUI

struct TopBarView: View {
    
    @EnvironmentObject var model:ZeusModel
    @State var cartViewSelected = false
    @State var isFormViewShowing = false
    
    var body: some View {
        
        HStack {
            Button(action: {
                isFormViewShowing = true
                
            }) {
                Image("menu")
                    .padding()
                    .background(Color("background"))
                    .cornerRadius(10.0)
            }
            
            Spacer()
            
            Button(action: {
                model.calculateTotalPrice()
                cartViewSelected = true
            }) {
                HStack{
                    
                    Image(systemName: "cart")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .cornerRadius(10.0)
                        .foregroundColor(.black)
                    
                    if model.orders.count > 0 {
                        
                        Image(systemName: "\(model.orders.count).circle")
                            .font(.title2)
                            .foregroundColor(.red)
                            .background(.white)
                            .padding(.bottom)
                    }
                }
            }.sheet(isPresented: $cartViewSelected) {
                CartView()
            }
        }
        .padding(.horizontal)
        .background(Color("background"))
        .sheet(isPresented: $isFormViewShowing) {
            InformationForm(isFormViewShowing:$isFormViewShowing)
        }
    }
}

