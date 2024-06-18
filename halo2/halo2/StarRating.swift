//
//  StarRating.swift
//  halo2
//
//  Created by formation on 18/06/2024.
//

import SwiftUI

struct StarRating: View {
    @Binding var rating: Int

    var body: some View {
        HStack {
            ForEach(1..<6) { number in
                Image(systemName: number > rating ? "star" : "star.fill")
                    .foregroundColor(number > rating ? .gray : .yellow)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
}
