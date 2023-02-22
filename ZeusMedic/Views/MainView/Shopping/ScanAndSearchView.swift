//
//  ScanAndSearchView.swift
//  Medical App
//
//  Created by Salah Najm on 10/4/22.
//

import SwiftUI

struct SearchAndScanView: View {
    @Binding var search: String
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Furniture", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing, 8)
      
        }
        .padding(.horizontal)
    }
}


