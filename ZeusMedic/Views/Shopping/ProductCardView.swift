//
//  CardView.swift
//  ZeusMedic
//
//  Created by Salah Najm on 10/4/22.
//

import SwiftUI

struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    let title: String
    let price: Double
    let rating: Double
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size/2, height: 120 * (size/300))
                .cornerRadius(20.0)
            
            Text(title)
                .font(Font.button)
                .bold()
            
            HStack {
                if rating != 0{
                    
                    StarRating(rating: rating, maxRating: 5)
                }
                Spacer()
                if price != 0{
                    
                    Text("$ \(String(price))")
                        .font(.bodyParagraph)
                }
                
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
        .foregroundColor(.black)
    }
    
    
}


