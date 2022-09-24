//
//  businessDetailView.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/17/22.
//

import SwiftUI
import RichText
import MapKit

struct ZeusDetailView: View {
    
    @EnvironmentObject var model:ZeusModel
    var selectedBusiness:tableAdmin
    @State private var selectedSheet = false
    
    //    @State var region = MKCoordinateRegion(
    //        center:  CLLocationCoordinate2D(
    //            latitude: 37.789467,
    //            longitude:-124.415772
    //        ),
    //        span: MKCoordinateSpan(
    //            latitudeDelta: 0.5,
    //            longitudeDelta: 0.5
    //        )
    //    )
    
    var body: some View {
        
        VStack(alignment:.leading) {
            Group{
                Text(selectedBusiness.firstName ?? "")
                    .bold()
                    .font(Font.titleText)
                    .padding(.bottom, 20)
                
                if selectedBusiness.addressLine1 != "" {
                    
                    Button {
                        //        ZeusMapView(selectedMapLat: selectedBusiness.latitude, selectedMapLong: selectedBusiness.longitude)
                        selectedSheet = true
                        
                    } label: {
                        
                        HStack{
                            Image(systemName: "mappin.circle")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .scaledToFill()
                            
                            Text(selectedBusiness.addressLine1 ?? "" )
                                .font(Font.smallText)
                        }
                    }.sheet(isPresented: $selectedSheet, content: {
                        VStack {
                            Text(selectedBusiness.firstName ?? "")
                                .bold()
                                .font(Font.titleText)
                                .padding(20)
                            
                            ZeusMapView(selectedMapLat: selectedBusiness.latitude!, selectedMapLong: selectedBusiness.longitude!, selectedMapTitle: selectedBusiness.firstName)
                            
                            //              ZeusMapView(selectedMapLat: selectedBusiness.latitude!, selectedMapLong: selectedBusiness.longitude!)
                        }
                        
                    })
                }
                
                if selectedBusiness.phoneNumber != "" {
                    HStack{
                        Image(systemName: "phone.circle")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .scaledToFill()
                        
                        Text(selectedBusiness.phoneNumber ?? "" )
                            .font(Font.smallText)
                    }
                }
                
                if selectedBusiness.email != "" && selectedBusiness.email != "-" {
                    HStack{
                        Image(systemName: "envelope.circle")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .scaledToFill()
                            .font(Font.smallText)
                        Text(selectedBusiness.email ?? "")
                            .font(.caption)
                        
                    }
                    
                }
                
            }  .padding(.horizontal)
            
            Divider()
            ScrollView {
                RichText(html: selectedBusiness.about ?? "")
                    .padding(.top, 30)
                    .font(Font.bodyParagraph)
                
                Spacer()
                
            }
            .padding()
            .navigationBarTitle("Specialty Details", displayMode: .inline)
        }
        
        
    }
}


//struct ZeusDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ZeusDetailView()
//    }
//}
