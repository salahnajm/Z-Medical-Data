//
//  StarRating.swift
//  Medical App
//
//  Created by Salah Najm on 10/5/22.
//

import SwiftUI

struct StarRating: View {
        var rating: CGFloat
        var maxRating: Int

        var body: some View {
            let stars = HStack(spacing: 0) {
                ForEach(0..<maxRating, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }

            stars.overlay(
                GeometryReader { g in
                    let width = rating / CGFloat(maxRating) * g.size.width
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .frame(width: width)
                            .foregroundColor(.yellow)
                    }
                }
                .mask(stars)
            )
            .foregroundColor(.gray)
        }
    }
