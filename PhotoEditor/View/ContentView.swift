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
    @State private var viewModel = PhotoEditorViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var isLandscape : Bool {
        verticalSizeClass == .compact
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                if isLandscape {
                    LandscapeLayout(viewModel: $viewModel, isLandscape: isLandscape)
                } else {
                    PortraitLayout(viewModel: $viewModel, isLandscape: isLandscape)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text(Constants.appName)
                        .font(.custom(Constants.fontName, size: 34))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
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
            }
            .sheet(isPresented: $viewModel.showingImagePicker) {
                ImagePicker(sourceType: $viewModel.sourceType, selectedImage: $viewModel.originalImage)
            }
            .alert(viewModel.saveImageResultMessage, isPresented: $viewModel.showSaveImageResultAlert) {}
            .padding(.vertical, 10)
            .background(
                LinearGradient(
                    colors: [.blue, .indigo, .purple],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
            )
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
