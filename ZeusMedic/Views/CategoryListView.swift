//
//  CategoryListView.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/28/22.
//

import SwiftUI

struct CategoryListView: View {
    
    @EnvironmentObject var model:ZeusModel
    @Binding var selectedCategory:String?
    
    // sorted list
    var businesses = [tableAdmin]()
    
    var body: some View {
        
        VStack {
            ScrollView {
                LazyVStack(alignment:.leading){
                    
                    ForEach(model.tableZeus) { t in
                        
                        if t.specialtiesZM2!.contains(where:((model.createAnArray(selectedCatZM: selectedCategory ?? "")).contains)) {
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
                                    VStack(alignment:.leading){
                                        
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
                
            }
        }
        .navigationBarTitle(selectedCategory ?? "")
        
    }
}


