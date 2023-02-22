//
//  RootView.swift
//
//  Created by Salah Najm on 9/19/22.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var model:ZeusModel
    @State var selectedCategory: String?
    @State var selectedTab: Tabs = .main
    //  @State var isOnBoarding = !AuthViewModel.isUserLoggedIn()
    
    var body: some View {
        
        if model.authorizationState == .notDetermined {
            
            OnboardingView()
            
        }
        else if model.authorizationState == .authorizedWhenInUse || model.authorizationState == .authorizedAlways {
            
            // Show HomeView
            TopBarView()
            
            NavigationView{
                ZStack {
                    Color("background")
                        .ignoresSafeArea(edges: [.top, .bottom])
                    
                    switch selectedTab {
                    case .main:
                        MainView()
                    case .list:
                        MedicalListView(selectedCategory: $selectedCategory)
                 //   case .categories:
                  //      MainCategoryView()
                    case .myHealth:
                        MyHealthView()
                    case .diagnosis:
                        DiagnosisView(genderPicker: "", agePicker: "", durationOfSymptoms: "")
                    case .news:
                        NewsView()
                        
                    }
                    
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

//struct RootView_Previews: PreviewProvider {
//    static var previews: some View {
//        RootView()
//        
//    }
//    
//}
