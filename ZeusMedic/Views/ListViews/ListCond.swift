//
//  ListCond.swift
//  Medical App
//
//  Created by Salah Najm on 11/5/22.
//

import SwiftUI

struct ListCond: View {
    
    var selectedBusiness:Business
    
    var body: some View {
        
        NavigationLink {
            ItemDetailView(selectedBusiness:selectedBusiness)
            
        } label: {
            
            HStack(spacing:20) {
                if selectedBusiness.imageData != nil {
                    let uiImage = UIImage(data: selectedBusiness.imageData ?? Data())
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: 48, height: 48)
                        .clipped()
                        .cornerRadius(8)
                        .shadow(radius: 5)
                }else {
                    Image("imageLogo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 48, height: 48)
                        .clipped()
                        .cornerRadius(5)
                        .shadow(radius: 2)
                }
                
                VStack(alignment:.leading){
                    //title
                    Text(selectedBusiness.name ?? "")
                        .bold()
                        .font(Font.subheadline)
                        .multilineTextAlignment(.leading)
                    
                    //First category
                    Text(selectedBusiness.categories?.first?.title ?? "" )
                        .font(Font.caption2)
                        .italic()
                }
                Spacer()
                VStack{
                    Text(String(format: "%.1f km away", (selectedBusiness.distance ?? 0)/1000))
                        .font(Font.caption)
                    Spacer()
                    //Reviews
                    Image("regular_\(selectedBusiness.rating ?? 0)")
                        .resizable()
                        .frame(width: 42, height:12)
                        .aspectRatio(contentMode: .fill)
                    Text("\(selectedBusiness.reviewCount ?? 0) Reviews")
                        .font(Font.caption)
                    
                }
                
            }.padding()
        }
        .foregroundColor(.black)
    }
}


