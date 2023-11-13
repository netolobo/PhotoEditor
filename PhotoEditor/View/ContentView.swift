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
                VStack (spacing: 0) {
                    
                    Spacer()
                    
                    Image(uiImage: viewModel.filteredImage)
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(viewModel.aplyingFilter ? 1.7 : 1.0)
                        .cornerRadius(25)
                        .padding(.horizontal, 5)
                    
                    Spacer()
                    
                    FilterPicker(viewModel: $viewModel)
                        .padding(.horizontal, 5)
                    
                    ImagePickerPanel(
                        showingImagePicker: $showingImagePicker,
                        sourceType: $sourceType
                    )
                    .padding(.top, 20)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(Constants.appName)
                        .font(.custom(Constants.fontName, size: 30))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                }
            }
            .toolbar {
                    Button {
                        viewModel.saveFilteredImage()
                    } label: {
                        Image(systemName: Constants.saveIcon)
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .opacity(viewModel.showSaveButton ? 1 : 0)
                    .symbolEffect(.bounce.down, value: viewModel.showSaveButton ? 1 : 0)
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(sourceType: $sourceType, selectedImage: $viewModel.originalImage)
            }
            .alert(viewModel.saveImageResultMessage, isPresented: $viewModel.showSaveImageResultAlert) {}
            .padding(.vertical, 10)
            .background(LinearGradient(colors: [.blue, .indigo, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        
    }
}

#Preview(Constants.lightMode) {
    ContentView()
}

#Preview(Constants.darkMode, traits: .sizeThatFitsLayout) {
    ContentView()
        .preferredColorScheme(.dark)
}
