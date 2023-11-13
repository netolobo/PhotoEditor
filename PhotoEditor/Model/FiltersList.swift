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

    
    var selectedFilter: CIFilter? {
        switch self {
        case .Original:
            return nil
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
    
    func filterImage(_ image: UIImage) -> UIImage {
        
        switch self {
        case .Original:
            return image
        case .Brazil:
            return  image.setFilter(image, selectedFilter)
        case .Ecuador:
            return  image.setFilter(image, selectedFilter)
        case .Iran:
            return image.setFilter(image, selectedFilter)
        case .Mexico:
            return  image.setFilter(image, selectedFilter)
        case .Japan:
            return  image.setFilter(image, selectedFilter)
        case .Canada:
            return  image.setFilter(image, selectedFilter)
        case .DominicRepublic:
            return  image.setFilter(image, selectedFilter)
        }
    }

}


