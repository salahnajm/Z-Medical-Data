//
//  LocationDeniedVie.swift
//  CitySites2.0
//
//  Created by Salah Najm on 9/8/22.
//

import SwiftUI

struct LocationDeniedView: View {
    
    let backGroundColor = Color(red: 34/255, green: 141/255, blue: 138/255)
    
    var body: some View {
    
        VStack(spacing:20){
            Spacer()
            Text("Whoops!")
                .font(.title)
            Text("We need to access your location in order to be able to show you all the locations near you. You can change access in settings")
            Spacer()
            Button {
                // Open settings
             //   UIApplication.openSettingsURLString
                
            } label: {
                ZStack{
                    Rectangle()
                        .frame(height:48)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    Text("Go to Settings")
                        .bold()
                        .foregroundColor(backGroundColor)
                        .padding()

                }
            }
            .padding()
            Spacer()
            
            
        }
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .background(backGroundColor)
        .ignoresSafeArea(.all, edges: .all)
    
    
    }
}

