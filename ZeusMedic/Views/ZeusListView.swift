//
//  ZeusListView.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/17/22.
//

import SwiftUI

struct ZeusListView: View {
    
    @EnvironmentObject var model:ZeusModel
 
    
    @State private var searchText = ""
    
    // sorted list?
    var businesses = [tableAdmin]()
    
    var body: some View {
        NavigationView {
            VStack {
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
                    LazyVStack(alignment:.leading){
                        
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
                                        
                                        Text(t.firstName ?? "")
                                            .font(Font.subheadline)
                                            .bold()
                                        
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
