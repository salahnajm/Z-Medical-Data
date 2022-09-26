//
//  ZeusListView.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/17/22.
//

import SwiftUI

struct ZeusListView: View {
    
    @EnvironmentObject var model:ZeusModel
  
    @State var searchText = ""
    
    // sorted list?
    var businesses = [tableAdmin]()

    var body: some View {
        
        NavigationView {
            
            VStack(alignment:.center) {
                HStack{
                    TextField("Search", text: $searchText)
                        .font(Font.bodyParagraph)
                        .padding(.horizontal)
                    Spacer()
                    Button {
                        searchText=""
                    } label: {
                        Image(systemName: "multiply.circle.fill")
                    }
                    .frame(width: 19, height: 19)
                    .tint(Color("icons-input"))
                }.padding()
                
                ScrollView {
                    LazyVStack{
                        
                        ForEach(model.tableZeus) { t in
                            if t.firstName!.lowercased().contains(searchText.lowercased()) || searchText.isEmpty {

                                NavigationLink {
                                    //Destination once clicked
                                    ZeusDetailView(selectedBusiness: t)
                                } label: {
                                    // Label for each row
                                    HStack(spacing:20) {
                                        Image("imageLogo")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height:48)
                                            .cornerRadius(5)
                                        VStack(alignment: .leading){
                                            
                                            Text(t.firstName ?? "")
                                                .font(Font.subheadline)
                                                .bold()
                                            
                                            Text(model.specialtyConvertedToString[(t.specialtiesZM2?.first ?? "")] ?? "")
                                                .font(Font.caption2)
                                                .italic()
                                        }
                                        
                                        Spacer()
                                        //Distance. I am not sure if it's in KM or other measure?

                                        Text(String(format: "%.1f km away", (t.distance ?? 0)/1000))
                                            .font(Font.caption2)
                                    }
                                }.foregroundColor(.black)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .navigationBarTitle((searchText=="" ? "All Listings" : searchText ), displayMode: .inline)
                }
            }
        }
    }
}

struct ZeusListView_Previews: PreviewProvider {
    static var previews: some View {
        ZeusListView()
    }
}
