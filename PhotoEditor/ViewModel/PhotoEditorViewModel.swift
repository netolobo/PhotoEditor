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
    
    func applyFilter(selectedFilter: CIFilter = CIFilter.pixellate()) {
        filteredImage = originalImage.filter(originalImage, selectedFilter) ?? originalImage
    }
    
    func saveFilteredImage() {
        filteredImage.save()
    }
}
