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
                    
                    FilterPicker(viewModel: viewModel)
                    
                    ImagePickerPanel(
                        showingImagePicker: $showingImagePicker,
                        sourceType: $sourceType
                    )
                    
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

#Preview(Constants.lightMode) {
    ContentView()
}

#Preview(Constants.darkMode) {
    ContentView()
        .preferredColorScheme(.dark)
}
