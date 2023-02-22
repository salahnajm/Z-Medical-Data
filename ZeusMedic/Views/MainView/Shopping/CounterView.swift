//
//  CounterView.swift
//  Medical App
//
//  Created by Salah Najm on 10/6/22.
//

import SwiftUI

struct CounterView: View {
    
    @State var numberOfItemsSelected:Int
    
    var body: some View {
        
        //    Counter
        HStack {
            //                        Minus Button
            Button(action: {
                
                if  numberOfItemsSelected > 0 {
                    numberOfItemsSelected -= 1
                }
            }) {
                Image(systemName: "minus")
                    .padding(.all, 8)
                
            }
            .frame(width: 30, height: 30)
            .overlay(RoundedCorner(radius: 50).stroke())
            .foregroundColor(.black)
            
            Text(String(numberOfItemsSelected))
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal, 8)
            
            //                        Plus Button
            Button(action: {
                numberOfItemsSelected += 1
                
            }) {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .padding(.all, 8)
                    .background(Color("Primary"))
                    .clipShape(Circle())
            }
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(numberOfItemsSelected: 1)
    }
}
