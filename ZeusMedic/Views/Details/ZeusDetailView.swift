//
//  businessDetailView.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/17/22.
//

import SwiftUI
import MapKit

struct ZeusDetailView: View {
    
    @EnvironmentObject var model:ZeusModel
    var selectedBusiness:Business
    @State var selectedSheet = false
    
    var body: some View {
        VStack(alignment:.leading){
            
            DetailHeader(selectedBusiness: selectedBusiness, selectedSheet: $selectedSheet)
                .padding(.horizontal)
            
            Divider()
            
            VStack(alignment:.leading, spacing:10){
                
                HStack{
                    Text("Specialty")
                        .font(Font.titleText)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    //Reviews
                    VStack(alignment:.leading){
                        Image("regular_\(selectedBusiness.rating ?? 0)")
                        Text("\(selectedBusiness.reviewCount ?? 0) Reviews")
                            .font(Font.caption)
                    }
                }
                
                ForEach(selectedBusiness.categories ?? [], id:\.self) { category in
                    
                    Text(category.title ?? "")
                        .font(Font.chatHeading)
                        .bold()
                }
                Spacer()
                
                ZeusMapView(selectedMapLat: selectedBusiness.coordinates!.latitude!, selectedMapLong: selectedBusiness.coordinates!.longitude!, selectedMapTitle: selectedBusiness.name ?? "")
                    .cornerRadius(12)
                    .shadow(radius: 10)
                    .padding()
                
                
                
            }
            .padding(.horizontal)
            .navigationBarTitle("Specialty Details", displayMode: .inline)
        }
        .sheet(isPresented: $selectedSheet, content: {
            VStack {
                Text(selectedBusiness.name ?? "")
                    .bold()
                    .font(Font.titleText)
                    .padding(.vertical, 20)
                
                ZeusMapView(selectedMapLat: selectedBusiness.coordinates!.latitude!, selectedMapLong: selectedBusiness.coordinates!.longitude!, selectedMapTitle: selectedBusiness.name ?? "")
                
            }
            
        })
    }
    
}


