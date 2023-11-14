//
//  LandscapeContentView.swift
//  Prismify
//
//  Created by Neto Lobo on 13/11/23.
//

import SwiftUI

struct LandscapeLayout: View {
    @Binding var viewModel: PhotoEditorViewModel
    
    var isLandscape : Bool
    
    var body: some View {
        HStack {
            VStack {
                Image(uiImage: viewModel.filteredImage)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(viewModel.applyingFilter ? 1.7 : 1.0)
                    .cornerRadius(25)
                    .padding(.horizontal, 5)
                
                ImagePickerPanel(
                    showingImagePicker: $viewModel.showingImagePicker,
                    sourceType: $viewModel.sourceType
                )
                .padding(.top, 5)
            }
            
            FilterPicker(viewModel: $viewModel, isLandscape: isLandscape)
                .padding(.horizontal, 5)   
        }
    }
}

#Preview {
    LandscapeLayout(viewModel: .constant(PhotoEditorViewModel()), isLandscape: true)
}
