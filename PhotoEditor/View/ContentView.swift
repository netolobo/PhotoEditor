//
//  ContentView.swift
//  PhotoEditor
//
//  Created by Neto Lobo on 08/11/23.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI


struct ContentView: View {
    
    @State private var showingImagePicker = false
    @State private var viewModel = PhotoEditorViewModel()
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Image(uiImage: viewModel.filteredImage)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(25)
                        .padding(.horizontal, 10)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(FiltersList.allCases, id: \.selectedFilter) { filter in
                                Button {
                                    viewModel.selectedFilter = filter.selectedFilter
                                    viewModel.applyFilter()
                                } label: {
                                    VStack {
                                        Text(filter.rawValue)
                                            .foregroundColor(.white)
                                            .font(.system(size: 15, weight: .bold, design: .rounded))
                                            .cornerRadius(25)
                                            .padding([.horizontal, .top], 5)
                                        
                                        
                                        Image(uiImage: filter.filteredImage(image: viewModel.originalImage))
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 140, height: 100)
                                            .background(.ultraThinMaterial)
                                            .clipped()
                                    }
                                    .background(.ultraThinMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                    
                                }
                            }
                            
                        }
                        .padding(.horizontal, 10)
                    }
                    
                    HStack (spacing: 40) {
                        Button {
                            sourceType = .photoLibrary
                            showingImagePicker.toggle()
                        } label: {
                            Image(systemName: "photo")
                                .frame(width: 80, height: 80)
                                .font(.largeTitle)
                                .foregroundColor(.primary)
                                .background(.regularMaterial)
                                .clipShape(Circle())
                        }
                        
                        Button {
                            sourceType = .camera
                            showingImagePicker.toggle()
                        } label: {
                            Image(systemName: "camera")
                                .frame(width: 80, height: 80)
                                .font(.largeTitle)
                                .foregroundColor(.primary)
                                .background(.regularMaterial)
                                .clipShape(Circle())
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Prismify")
                            .font(.custom("Agbalumo", size: 30))
                            .fontWeight(.black)
                            .foregroundColor(.white)
                    }
                }
                .toolbar {
                    Button {
                        viewModel.saveFilteredImage()
                    } label: {
                        Image(systemName: "photo.badge.arrow.down")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
                
                .sheet(isPresented: $showingImagePicker) {
                    ImagePicker(sourceType: $sourceType, selectedImage: $viewModel.originalImage)
                }
                .padding(.vertical, 10)
            }
            .background(LinearGradient(colors: [.blue, .indigo, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        
    }
}

#Preview {
    ContentView()
}
