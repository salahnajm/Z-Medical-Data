//
//  DetailHeader.swift
//  Medical App
//
//  Created by Salah Najm on 11/5/22.
//

import SwiftUI

struct DetailHeader: View {
    
    var selectedBusiness:Business
    @Binding var selectedSheet:Bool
    
    var body: some View {
       
        VStack(alignment:.leading) {
            Text(selectedBusiness.name ?? "")
                .bold()
                .font(Font.titleText)
                .padding(.bottom, 20)
                .multilineTextAlignment(.leading)
            
            HStack{
                VStack(alignment:.leading){
                // Address with map view
                Button {
                    
                    ZeusMapView(selectedMapLat: selectedBusiness.coordinates?.latitude ?? 0, selectedMapLong: selectedBusiness.coordinates?.longitude ?? 0)
                    selectedSheet = true
                    
                } label: {
                    //Map
                    HStack{
                        Image(systemName: "mappin.circle")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .scaledToFill()
                        
                        Text("\(selectedBusiness.location?.address1 ?? ""), \(selectedBusiness.location?.city ?? "") ")
                            .font(Font.smallText)
                    }
                }
                
                // Phone Number
                if selectedBusiness.displayPhone != "" {
                    HStack{
                        Image(systemName: "phone.circle")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .scaledToFill()
                        
                        Link(selectedBusiness.displayPhone!, destination: URL(string: "tel:\(ModelHelpers.sanitizePhoneNumber(phone: selectedBusiness.displayPhone!))")!)
                            .font(Font.smallText)
                        
                    }
                }
                
                // url
                if selectedBusiness.url != "" {
                    HStack{
                        Image(systemName: "globe")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .scaledToFill()
                        
                        Link("Yelp Link", destination: URL(string: selectedBusiness.url!)!)
                            .font(Font.smallText)
                        
                    }
                }
            }
                Spacer()
                
                if selectedBusiness.imageData != nil {
                    let uiImage = UIImage(data: selectedBusiness.imageData ?? Data())
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipped()
                        .cornerRadius(12)
                        .shadow(radius: 10)
                        .padding()
                }
                
            }
            }
        .foregroundColor(Color("text-primary"))
    }
}

//struct DetailHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailHeader()
//    }
//}
