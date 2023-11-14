//
//  PhotoEditorViewModel.swift
//  PhotoEditor
//
//  Created by Neto Lobo on 09/11/23.
//

import Foundation
import UIKit
import SwiftUI

@Observable
class PhotoEditorViewModel {
    var originalImage: UIImage = Constants.defaultImage {
        didSet {
                filteredImage = originalImage
        }
    }
    var filteredImage: UIImage = Constants.defaultImage
      
    var filters = Filter.allCases
    
    var applyingFilter = false 
    
    var showSaveButton = false
    
    var showSaveImageResultAlert = false
    
    var saveImageResultMessage : String = ""
    
    var showingImagePicker = false
    
    var sourceType: UIImagePickerController.SourceType = .camera
    
    func applyFilter(selectedFilter: CIFilter? = CIFilter.pixellate()) {
        filteredImage = originalImage.setFilter(originalImage, selectedFilter)
        applyingFilter = false
    }
    
    func saveFilteredImage() {
        filteredImage.save { message in
            self.showSaveImageResultAlert.toggle()
            self.saveImageResultMessage = message
        }
    }
}
