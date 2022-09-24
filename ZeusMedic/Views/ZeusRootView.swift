//
//  ZeusRootView.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/19/22.
//

import SwiftUI



struct RootView: View {
    
    @EnvironmentObject var model:ZeusModel
    
    @State var selectedTab: Tabs = .main
 //  @State var isOnBoarding = !AuthViewModel.isUserLoggedIn()
    
    var body: some View {
    
       if model.authorizationState == .notDetermined {
            
          OnboardingView()
            
         }
        else if model.authorizationState == .authorizedWhenInUse || model.authorizationState == .authorizedAlways {
        
            // Show HomeView
        
        
        
        ZStack {
        Color("background")
            .ignoresSafeArea(edges: [.top, .bottom])
        
        
        switch selectedTab {
        case .main:
            MainView()
        case .list:
            ZeusListView()
        case .diagnosis:
            DiagnosisView(agePicker: 1, durationOfSymptoms: 1)
        case .news:
            NewsView()
        case .categories:
            ZeusCategoryView()
        }
        }
            Spacer()
        
            CustomTabBar(selectedTab: $selectedTab)
        
        }
        
        else {
            LocationDeniedView()
            
        }
        
    // .fullScreenCover(isPresented: $isOnBoarding) {
            //on dismiss
            
 //       } content: {
            
            // the onboarding sequence
        //       OnBoardingContainerView(isOnboarding: $isOnBoarding)
        
 //       }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
           
    }
   
}
