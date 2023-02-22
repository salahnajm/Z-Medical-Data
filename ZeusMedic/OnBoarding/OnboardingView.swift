//
//  OnboardingView.swift
//  Created by Salah Najm on 9/8/22.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var model:ZeusModel
    @State private var tabSelection = 0
    
    private let blue = Color(red: 0/255, green: 130/255, blue: 167/255)
    private let turquoise = Color(red: 55/255, green: 197/255, blue: 192/255)

    var body: some View {
        
        VStack {
            // Tab view
            
            TabView(selection: $tabSelection) {
                // First tab
                VStack (spacing: 20){
                    Image("city2")
                        .resizable()
                        .scaledToFit()
                    Text(Constants.OnBoardingWelcomeMessage)
                        .bold()
                        .font(.title)
                    Text(Constants.OnBoardingWelcomeExplanation)
                        .multilineTextAlignment(.center)
                }
                .foregroundColor(.white)
                .tag(0)
                
                // Second tab
                    // First tab
                VStack (spacing: 20){
                        Image("city1")
                            .resizable()
                            .scaledToFit()
                    Text(Constants.OnBoardingPage2)
                            .bold()
                            .font(.title)
                    Text(Constants.OnBoardingPage2Explanation)
                        .multilineTextAlignment(.center)
                        
                    }
                    .foregroundColor(.white)
                    .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            // Button
            
            Button {
                if tabSelection == 0 {
                    tabSelection = 1
                    
                    
                    
                }else {
                    // Request geolocation permission
                    model.requestGeolocationPermission()
                }
                    
            } label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height:48)
                        .cornerRadius(10)
                    Text(tabSelection==0 ? "Next" : "Get My Location")
                        .bold()
                        .padding()
                    
                }
            }
            .padding()
            .accentColor(tabSelection==0 ? blue: turquoise)
            
        }
    
        .background(tabSelection == 0 ? blue : turquoise)
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
