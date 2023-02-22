//
//  Business.swift
//  ZeusMedic
//
//  Created by Salah Najm on 11/3/22.
//

import Foundation

//Yelp

class Business: Decodable, Identifiable, ObservableObject {
    
    //need to get image data from yelp
    @Published var imageData: Data?
    
    var id: String?
    var alias: String?
    var name: String?
    var imageUrl: String?
    var isClosed: Bool?
    var url: String?
    var reviewCount: Int?
    var categories: [Category]?
    var rating: Double?
    var coordinates: Coordinate?
    var transactions: [String]?
    var price: String?
    var location: Location?
    var phone: String?
    var displayPhone: String?
    var distance: Double?
    
    enum CodingKeys: String, CodingKey {
        
        case imageUrl = "image_url"
        case isClosed = "is_closed"
        case reviewCount = "review_count"
        case displayPhone = "display_phone"
        case id
        case alias
        case name
        case url
        case categories
        case rating
        case coordinates
        case transactions
        case price
        case location
        case phone
        case distance
    }
    
    func getImageData() {
        // make sure it is not nil
        guard imageUrl != nil else {
            return
        }
        // Download image. need to get the URL first
        if let url = URL(string: imageUrl!) {
            
            //start session to get data. Data/response/error
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: url) { (data, response, error) in
                
                if error == nil {
                    DispatchQueue.main.async {
                        // set image data
                        self.imageData = data!
                    }
                }
            }
            dataTask.resume()
        }
    }
    
}


struct Location: Decodable {
    var address1: String?
    var address2: String?
    var city: String?
    var zipCode: String?
    var country: String?
    var state: String?
    var displayAddress: [String]?
    
    enum CodingKeys: String, CodingKey {
        case address1
        case address2
        case city
        case zipCode = "zip_code"
        case country
        case state
        case displayAddress = "display_address"
    }
}

struct Category: Decodable, Hashable {
    var alias: String?
    var title: String?
}

struct Coordinate: Decodable {
    var latitude: Double?
    var longitude: Double?
}


struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
    
}

struct Region:Decodable {
    var center = Coordinate()
    
}
