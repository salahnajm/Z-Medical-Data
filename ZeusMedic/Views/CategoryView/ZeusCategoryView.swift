//
//  RecipeCategoryView.swift
//  RecipeApp2.0
//
//  Created by Salah Najm on 9/9/22.
//
// Reference:
//https://www.appcoda.com/learnswiftui/swiftui-expandable-list.html
//

import SwiftUI

struct ZeusCategoryView: View {

    @EnvironmentObject var model:ZeusModel
    
    @State var selectedCategory: String?
    
    var body: some View {
     
            ScrollView{
                VStack(alignment:.leading){
                    ForEach(model.businessCategories.sorted(), id:\.self) { item in
                    
                    NavigationLink(tag:item, selection: $selectedCategory) {
                        //   CategoryListView(selectedCategory: $selectedCategory)
                        ZeusListView(selectedCategory: $selectedCategory)
                    }
                    
                label: {
                    
                    ZStack{
                        Rectangle()
                            .frame(height:48)
                            .cornerRadius(10)
                            .foregroundColor(Color(red: 55/255, green: 197/255, blue: 192/255))
                            .padding(.horizontal)
                        Text(item)
                            .font(Font.body)
                    }
                    .foregroundColor(.black)

                    
                }
                
                    
                }
                
            }
        }
        
    }
    
}



/*
 
 
 
 struct ZeusCategory: Identifiable {
 let id = UUID()
 let name: String
 var subMenuItems: [String]?
 //    let icon: String
 
 
 //SubItems
 static let categoriesZM = [ZeusCategory(name:"Aesthetics, hair, spa,skin"),
 ZeusCategory(name:"Hearing, vision, ENT"),
 ZeusCategory(name:"Diabetes, nutrition, dietician"),
 ZeusCategory(name:"Fitness, rehab, sports, physical therapy")]
 
 static let equipmentAndPharamciesZM = [ZeusCategory(name:"Medical Equipment"),
 ZeusCategory(name:"Pharmacies")]
 
 static let dental = [ZeusCategory(name:"Dental")]
 
 static let aleternativeMedicine = [ZeusCategory(name:"Alternative Medicine"),
 ZeusCategory(name:"Osteopathic")]
 
 static let clinicsZM = [ ZeusCategory(name:"Clinics"),
 ZeusCategory(name:"Hospital, medical center"),
 ZeusCategory(name:"Emergency"),
 ZeusCategory(name:"Imaging, lab"),
 ZeusCategory(name:"Urgent Care")]
 
 
 static let specialtiesZM = [
 ZeusCategory(name:"General Medicine"),
 ZeusCategory(name:"Allergy, lung, respiratory"),
 ZeusCategory(name:"Surgery"),
 ZeusCategory(name:"Women's health, OB, GYN"),
 ZeusCategory(name:"Psychiatry and Behavioral health"),
 ZeusCategory(name:"Palliative Medicine"),
 ZeusCategory(name:"Pathology"),
 ZeusCategory(name:"Pediatric"),
 ZeusCategory(name:"Nephrologist"),
 ZeusCategory(name:"Neurologic, spine"),
 ZeusCategory(name:"Orthopedics"),
 ZeusCategory(name:"Hematologic Oncology"),
 ZeusCategory(name:"Gastroenterology"),
 ZeusCategory(name:"Cardiac")]
 
 
 // Main Group
 
 static let groupOne = ZeusCategory(name: "Aesthetics, fitness, hearing, vision", subMenuItems: [ZeusCategory.categoriesZM])
 static let groupTwo = ZeusCategory(name: "Pharmacies and DMEs", subMenuItems: equipmentAndPharamciesZM)
 static let groupThree = ZeusCategory(name: "Dental", subMenuItems: dental)
 static let groupFour = ZeusCategory(name: "Alternative Medicine", subMenuItems: aleternativeMedicine)
 static let groupFive = ZeusCategory(name: "Find Medical Help", subMenuItems: clinicsZM)
 static let groupSix = ZeusCategory(name: "Specialties", subMenuItems: specialtiesZM)
 
 
 }
 
 struct ZeusCategoryView: View {
 
 @EnvironmentObject var model: ZeusModel
 //  @Binding var selectedTab:Int
 
 //  @State private var didTap1:Bool = false
 
 var body: some View {
 
 let items: [ZeusCategory]  = [.groupOne, .groupTwo, .groupThree, .groupFour, .groupFive, .groupSix]
 
 VStack(alignment:.leading) {
 
 Text("Categories")
 .bold()
 .padding(.leading)
 .font(.largeTitle)
 
 List(items, children: \.subMenuItems) { row in
 //  Image(systemName: row.icon)
 Text(row.name)
 }
 
 
 /*
  GeometryReader { geo in
  
  ScrollView(showsIndicators: false) {
  
  
  
  
  VStack {
  //Clinics
  Text("Medical Help")
  .font(Font.title)
  LazyVGrid (columns: [GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20, alignment: .top)], alignment: .center, spacing: 20) {
  
  ForEach(categoriesZM.sorted(by: >), id: \.key) { category, key in
  
  Button {
  //            selectedTab = 2
  //        model.selectedCategory = category
  
  } label: {
  
  BoxButtonZM(label: category)
  .foregroundColor(!didTap1 ? Color("icons-input"): Color("bubble-secondary"))
  .frame(width: geo.size.width/4, height: geo.size.width/8)
  }
  }
  }
  }
  
  
  
  Divider()
  
  
  //Specialties
  VStack {
  Text("Specialties")
  .font(Font.title)
  LazyVGrid (columns: [GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20, alignment: .top)], alignment: .center, spacing: 20) {
  
  ForEach(specialtiesZM.sorted(by: >), id: \.key) { category, key in
  
  Button {
  //            selectedTab = 2
  //        model.selectedCategory = category
  
  } label: {
  
  BoxButtonZM(label: category)
  .foregroundColor(!didTap1 ? Color("icons-input"): Color("bubble-secondary"))
  .frame(width: geo.size.width/4, height: geo.size.width/8)
  }
  }
  }
  }
  Divider()
  
  //Alternative Medicne
  VStack {
  Text("Alternative Medicine")
  .font(Font.title)
  LazyVGrid (columns: [GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20, alignment: .top)], alignment: .center, spacing: 20) {
  
  ForEach(aleternativeMedicine.sorted(by: >), id: \.key) { category, key in
  
  Button {
  //            selectedTab = 2
  //        model.selectedCategory = category
  
  } label: {
  
  BoxButtonZM(label: category)
  .foregroundColor(!didTap1 ? Color("icons-input"): Color("bubble-secondary"))
  .frame(width: geo.size.width/4, height: geo.size.width/8)
  }
  }
  }
  }
  Divider()
  
  
  //Dental
  VStack {
  Text("Dental")
  .font(Font.title)
  LazyVGrid (columns: [GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20, alignment: .top)], alignment: .center, spacing: 20) {
  
  ForEach(dental.sorted(by: >), id: \.key) { category, key in
  
  Button {
  //            selectedTab = 2
  //        model.selectedCategory = category
  
  } label: {
  
  BoxButtonZM(label: category)
  .foregroundColor(!didTap1 ? Color("icons-input"): Color("bubble-secondary"))
  .frame(width: geo.size.width/4, height: geo.size.width/8)
  }
  }
  }
  }
  Divider()
  
  
  
  
  
  Group{
  
  //Equipment, Pharmacies
  VStack {
  Text("Equipment, Pharmacies")
  .font(Font.title)
  LazyVGrid (columns: [GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20, alignment: .top)], alignment: .center, spacing: 20) {
  
  ForEach(equipmentAndPharamciesZM.sorted(by: >), id: \.key) { category, key in
  
  Button {
  //            selectedTab = 2
  //        model.selectedCategory = category
  
  } label: {
  
  BoxButtonZM(label: category)
  .foregroundColor(!didTap1 ? Color("icons-input"): Color("bubble-secondary"))
  .frame(width: geo.size.width/4, height: geo.size.width/8)
  }
  }
  }
  }
  Divider()
  
  //Other
  VStack {
  Text("Other")
  .font(Font.title)
  LazyVGrid (columns: [GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20, alignment: .top)], alignment: .center, spacing: 20) {
  
  ForEach(categoriesZM.sorted(by: >), id: \.key) { category, key in
  
  Button {
  //            selectedTab = 2
  //        model.selectedCategory = category
  
  } label: {
  
  BoxButtonZM(label: category)
  .foregroundColor(!didTap1 ? Color("icons-input"): Color("bubble-secondary"))
  .frame(width: geo.size.width/4, height: geo.size.width/4)
  }
  }
  }
  }
  
  
  }
  
  
  
  }
  
  
  }
  
  */
 
 }
 }
 
 }
 
 */
