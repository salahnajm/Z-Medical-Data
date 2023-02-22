//  ZeusListView.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/17/22.
//

import SwiftUI

struct ZeusListView: View {
    
    @Binding var selectedCategory:String?
    
    @EnvironmentObject var model:ZeusModel
    @State var searchText = ""
    
    var body: some View {
        
        ScrollView {
            LazyVStack(alignment:.leading){
                
                //ForEach business, loop through them
                ForEach(model.restaurants) { restaurant in
                    
                    if selectedCategory == nil {
                        ZeusListCond(selectedBusiness: restaurant)
                    }
                    else {
                        
                        //   forEach categories inside the business
                        ForEach(restaurant.categories!, id:\.self) { t in
                            
                            
                            if t.title == selectedCategory
                            {
                                ZeusListCond(selectedBusiness: restaurant)
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
            
        }
        
    }
    
}
