//
//  Filters.swift
//  PhotoEditor
//
//  Created by Neto Lobo on 09/11/23.
//

import Foundation
import CoreImage
import UIKit

enum FiltersList : String, CaseIterable {
    case Original = "Original"
    case Brazil = "Brazil"
    case Canada = "Canada"
    case DominicRepublic = "Dominic Republic"
    case Ecuador = "Ecuador"
    case Iran = "Iran"
    case Mexico = "Mexico"
    case Japan = "Japan"
    
    
    var selectedFilter: CIFilter {
        switch self {
        case .Original:
            return CIFilter.colorInvert()
        case .Brazil:
            return CIFilter.sharpenLuminance()
        case .Ecuador:
            return CIFilter.photoEffectFade()
        case .Iran:
            return CIFilter.photoEffectInstant()
        case .Mexico:
            return CIFilter.sepiaTone()
        case .Japan:
            return CIFilter.photoEffectMono()
        case .Canada:
            return CIFilter.photoEffectProcess()
        case .DominicRepublic:
            return CIFilter.photoEffectTransfer()
        }
    }
    
    func filterImage(image: UIImage) -> UIImage {
        
        switch self {
        case .Original:
            return image
        case .Brazil:
            return image.filter(image, selectedFilter) ?? image
        case .Ecuador:
            return image.filter(image, selectedFilter) ?? image
        case .Iran:
            return image.filter(image, selectedFilter) ?? image
        case .Mexico:
            return image.filter(image, selectedFilter) ?? image
        case .Japan:
            return image.filter(image, selectedFilter) ?? image
        case .Canada:
            return image.filter(image, selectedFilter) ?? image
        case .DominicRepublic:
            return image.filter(image, selectedFilter) ?? image
        }
    }

}


