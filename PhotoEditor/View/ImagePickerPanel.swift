//
//  ImagePickerPanel.swift
//  PhotoEditor
//
//  Created by Neto Lobo on 12/11/23.
//

import SwiftUI

struct ImagePickerPanel: View {
    @Binding var showingImagePicker: Bool
    @Binding var sourceType: UIImagePickerController.SourceType
    
    var body: some View {
        HStack (spacing: 40) {
            ImagePickerButton(iconName: Constants.photoIcon) {
                showingImagePicker.toggle()
                sourceType = .photoLibrary
            }
            
            ImagePickerButton(iconName: Constants.cameraIcon) {
                showingImagePicker.toggle()
                sourceType = .camera
            }
        }
    }
}

#Preview(Constants.lightMode, traits: .sizeThatFitsLayout) {
    ImagePickerPanel(showingImagePicker: .constant(false), sourceType: .constant(.camera))
        .padding()
}

#Preview(Constants.darkMode, traits: .sizeThatFitsLayout) {
    ImagePickerPanel(showingImagePicker: .constant(false), sourceType: .constant(.camera))
        .preferredColorScheme(.dark)
        .padding()
}
