//
//  CustomTabBar.swift
//  swiftui-chat
//
//  Created by Salah Najm on 9/10/22.
//

import SwiftUI

enum Tabs:Int {
    
    case main = 0
    case list = 1
    case diagnosis = 2
    case news = 3
 //   case categories = 4
    case myHealth = 5
    
}

struct CustomTabBar: View {
    
    @Binding var selectedTab:Tabs
    
    var body: some View {
       
        ZStack{
        Rectangle()
                .foregroundColor(.white)
                .shadow(color: (Color("date-pill")), radius: 5, x: 0, y: -3)
                .ignoresSafeArea()
            
        HStack(alignment:.center){
            
            // MainView
            
            Button {
                selectedTab = .main
            } label:{
                TabBarButton(buttonText: "Home", imageName: "house", isActive: selectedTab == .main)
            }
            .tint(Color("icons-secondary"))
            
            // list
            Button {
                selectedTab = .list
            } label: {
                TabBarButton(buttonText: "All Listings", imageName: "list.bullet", isActive: selectedTab == .list)
            }.tint(Color("icons-secondary"))
            
            // Diagnosis
            Button {
                selectedTab = .diagnosis
            } label: {
                TabBarButton(buttonText: "Diagnose me", imageName: "stethoscope", isActive: selectedTab == .diagnosis)
            }.tint(Color("icons-secondary"))
            
            // News
            Button {
                selectedTab = .news
            } label: {
                TabBarButton(buttonText: "News", imageName: "newspaper", isActive: selectedTab == .news)
            }.tint(Color("icons-secondary"))
            
            // Categories
            Button {
                selectedTab = .myHealth
            } label: {
                TabBarButton(buttonText: "My Health", imageName: "heart.fill", isActive: selectedTab == .myHealth)
            }.tint(Color("icons-secondary"))
        
        }
            .shadow(color: (Color("date-pill")), radius: 3, x: 0, y: 3)
        }
        .frame(height:82)
    }
}

