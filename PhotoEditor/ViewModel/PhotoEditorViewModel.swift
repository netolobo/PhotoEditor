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
      
    var filterList  = FiltersList.allCases
    
    var aplyingFilter = false 
    
    var showSaveButton = false
    
    var showSaveImageResultAlert = false
    
    var saveImageResultMessage : String = ""
    
    func applyFilter(selectedFilter: CIFilter? = CIFilter.pixellate()) {
        filteredImage = originalImage.setFilter(originalImage, selectedFilter)
        aplyingFilter = false
    }
    
    func saveFilteredImage() {
        filteredImage.save { message in
            self.showSaveImageResultAlert.toggle()
            self.saveImageResultMessage = message
        }
    }
}
