//
//  ZeusTabView.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/9/22.
//

import SwiftUI

struct ZeusTabView: View {
    
    @State var selectedCategory: String?
    @EnvironmentObject var model:ZeusModel
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
            
            DiagnosisView(genderPicker: "", agePicker: "", durationOfSymptoms: "")
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
            
            ZeusListView(selectedCategory:$selectedCategory)
                .padding()
                .tabItem {
                    VStack{
                        Image(systemName: "gearshape")
                        Text("List")
                    }
                    
                    
                }.tag(5)

        }
        
    }
}
//struct ZeusTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        ZeusTabView()
//    }
//}
