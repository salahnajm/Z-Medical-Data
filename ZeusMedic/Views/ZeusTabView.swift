//
//  ZeusTabView.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/9/22.
//

import SwiftUI

struct ZeusTabView: View {
    
    @State var selectedBusiness:tableAdmin?
    @State var tabIndex = 1
    
    var body: some View {
        
        
        TabView(selection: $tabIndex) {
       
            MainView()
                .padding()
                .tabItem {
                    VStack{
                        Image(systemName: "text.magnifyingglass")
                        Text("Home")
                    }
                }.tag(1)
            
            DiagnosisView(agePicker: 1, durationOfSymptoms: 1)
                .padding()
                .tabItem {
                    VStack{
                        Image(systemName: "stethoscope")
                        Text("Diagnose Me")
                    }
                    
                    
                }.tag(2)
            
            NewsView()
                .padding()
                .tabItem {
                    VStack{
                        Image(systemName: "newspaper")
                        Text("News")
                    }
                    
                    
                }.tag(3)
//            Text("Account")
//                .padding()
//                .tabItem {
//                    VStack{
//                        Image(systemName: "iphone.homebutton.circle")
//                        Text("Account")
//                    }
//                    
//                    
//                }.tag(4)
//            
            
            ZeusListView()
                .padding()
                .tabItem {
                    VStack{
                        Image(systemName: "gearshape")
                        Text("List")
                    }
                    
                    
                }.tag(5)
            
            
//            ZeusMapView(selectedRental: $selectedBusiness)
//                .padding()
//                .tabItem {
//                    VStack{
//                        Image(systemName: "map.circle")
//                        Text("Map")
//                    }
//
//
//                }.tag(6)

        }
        
           }
}
struct ZeusTabView_Previews: PreviewProvider {
    static var previews: some View {
        ZeusTabView()
    }
}
