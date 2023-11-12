//
//  ImageFilter.swift
//  PhotoEditor
//
//  Created by Neto Lobo on 09/11/23.
//

import Foundation
import UIKit

extension UIImage {
    func filter(_ inputImage: UIImage, _ selectedFilter: CIFilter?) -> UIImage? {
        
        
        let beginImage = CIImage(image: inputImage)
        let context = CIContext()
        
        guard let currentFilter = selectedFilter else { return  nil }
        
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        
        let amount = 1.0
        let inputKeys = currentFilter.inputKeys

        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
        }
        
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(amount * 300, forKey: kCIInputRadiusKey)
        }
        
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)
        }
        
        guard let outputImage = currentFilter.outputImage else { return nil  }
        
        if let cgImg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgImg)
            return uiImage
        }
        
        return nil
    }
}
