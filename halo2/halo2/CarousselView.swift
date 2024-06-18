//
//  CarousselView.swift
//  halo2
//
//  Created by formation on 18/06/2024.
//
import SwiftUI

struct CarouselView: View {
    @Binding var selectedImage: String
    @Binding var selectedTitle: String
    @Binding var selectedDescription: String
    @Binding var selectedRating: Double
    @Binding var rating: Int

    let items = [
        ("Halo", "Halo", "Depicting an epic 26th-century conflict between humanity and an alien threat known as the Covenant, the series weaves deeply drawn personal stories with action, adventure and a richly imagined vision of the future.", 4.1),
        ("MaxPain", "Max Payne", "A story-driven third-person shooter that follows the life of Max Payne.", 4.5),
        ("CounterStricke", "Counter Strike", "A multiplayer first-person shooter game that pits terrorists against counter-terrorists.", 4.7),
        ("CallOff", "Call of Duty", "A popular first-person shooter game series set in various historical and modern warfare settings.", 4.3)
    ]

    var body: some View {
        TabView {
            ForEach(items, id: \.0) { item in
                VStack {
                    Image(item.0)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 150)
                        .clipped()
                        .onTapGesture {
                            selectedImage = item.0
                            selectedTitle = item.1
                            selectedDescription = item.2
                            selectedRating = item.3
                            rating = Int(item.3) // Set the rating to the integer part of the selected rating
                        }
                    
                    Text(item.1)
                        .font(.headline)
                        .padding(.top, 8)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(10)
                .padding()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
