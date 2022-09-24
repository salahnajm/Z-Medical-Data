//
//  MainView.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/9/22.
//

import SwiftUI

struct MainView: View {
    
  //  @State var findCategories:String
    @State private var searchNearby=""
    
    var body: some View {
    
        VStack {
          
            Spacer()
            
            Text("ZeusMedic")
                .font(Font.titleText)
                .bold()
            Image("logoTransparent")
                .resizable()
                .frame(height:170)
                .aspectRatio(1, contentMode: .fill)
           //     .scaledToFit()
                

            
            Spacer()
            //Text Field
            
            Text("Find nearby medical help")
                .font(Font.bodyParagraph)
                .padding(.bottom, 15)
            
            ZStack{
                Rectangle()
                    .frame(height:56)
                    .foregroundColor(Color("input"))
                
                HStack{
                    
                    TextField("e.g. Doctor...", text: $searchNearby)
                        .font(Font.bodyParagraph)
                        .padding(.horizontal)
                    Spacer()
                    
                    Button {
                       searchNearby=""
                        
                    } label: {
                        Image(systemName: "multiply.circle.fill")
                           
                    }
                    .frame(width: 19, height: 19)
                    .tint(Color("icons-input"))
                   
                    
                }
            
            

            }.padding()
            
            Button {
                //Action
            } label: {
                ButtonZM(buttonText: "Find")
            }
                .padding(.horizontal)
                .padding(.bottom, 15)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
