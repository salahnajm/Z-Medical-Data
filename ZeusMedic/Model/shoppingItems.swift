//
//  shoppingItems.swift
//  ZeusMedic
//
//  Created by Salah Najm on 10/5/22.
//

import Foundation

class shoppingItems:Identifiable, Decodable {
    
    var id:Int?
    var title:String?
    var category:String?
    var description1:String?
    var description2:String?
    var price:Double?
    var isFeatured:String?
    var options:String?
    var colors:String?
    var image1:String?
    var image2:String?
    var image3:String?
    var image4:String?
    var image5:String?
    var starRating:Double?
}

//struct cartItems: Identifiable {
//   var id: String
//   var product: shoppingItems
//   var count: Int
//init(product: shoppingItems, count: Int) {
//   self.id = UUID().uuidString
//   self.product = product
//   self.count = count
//}}

struct cartItems: Identifiable {
    var id:Int?
    var title:String?
    var numberOfItems:Int?
    var price:Double?
    var image:String?
}
