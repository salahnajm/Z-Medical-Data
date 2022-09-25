//
//  SearchView.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/25/22.
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject var search:BusinessSearch
    
    var body: some View {
        NavigationView {
            VStack {
                
                ScrollView {
                    LazyVStack(alignment:.leading){
                        
                        ForEach(search.businesses) { t in
                           
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
                                        
                                        Text(t.)
                                            .font(Font.subheadline)
                                            .bold()
                                    }
                                }.foregroundColor(.black)
                            }
                        }
                        
                    }
                    .padding(.horizontal)
               
                }
                
            }
        }
        
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
