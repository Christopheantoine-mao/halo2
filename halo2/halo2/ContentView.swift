//
//  ContentView.swift
//  halo2
//
//  Created by formation on 18/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var rating: Int = 3 // Default rating
    @State private var searchText: String = ""
    @State private var selectedImage: String = "Halo" // Default image
    @State private var selectedTitle: String = "Halo"
    @State private var selectedDescription: String = "Depicting an epic 26th-century conflict between humanity and an alien threat known as the Covenant, the series weaves deeply drawn personal stories with action, adventure and a richly imagined vision of the future."
    @State private var selectedRating: Double = 4.1

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    // Section 1: Background image with paragraph and star rating system
                    ZStack {
                        Image(selectedImage) // Dynamically selected image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.65)
                            .clipped()
                        
                        VStack {
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Text(selectedTitle)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                StarRating(rating: $rating)
                                    .padding(.vertical, 4)
                                
                                Text("\(selectedRating, specifier: "%.1f") / 5")
                                    .foregroundColor(.white)
                                
                                Text(selectedDescription)
                                    .font(.body)
                                    .padding()
                                    .background(Color.black.opacity(0.5))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                            }
                            .padding(.bottom, 20)
                        }
                    }
                    .frame(height: geometry.size.height * 0.65)
                    
                    // Section 2: Carousel at the bottom
                    VStack {
                        Text("Vous aimerez peut être")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        CarouselView(selectedImage: $selectedImage, selectedTitle: $selectedTitle, selectedDescription: $selectedDescription, selectedRating: $selectedRating, rating: $rating)
                            .frame(height: geometry.size.height * 0.35)
                    }
                    .background(Color.black.opacity(0.8))
                    .foregroundColor(.white)
                }
                .edgesIgnoringSafeArea(.all)
                .navigationBarTitle("Home", displayMode: .inline)
                .navigationBarItems(leading:
                    Button(action: {
                        // Action for home button
                    }) {
                        Image(systemName: "house.fill")
                    },
                    trailing:
                    HStack {
                        TextField("Search", text: $searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading, 8)
                        
                        Button(action: {
                            // Action for search
                        }) {
                            Image(systemName: "magnifyingglass")
                        }
                    }
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
