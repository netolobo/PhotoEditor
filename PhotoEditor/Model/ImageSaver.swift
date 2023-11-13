//
//  ImageSaver.swift
//  Prismify
//
//  Created by Neto Lobo on 12/11/23.
//

import Foundation
import UIKit

class ImageSaver: NSObject {
    var sucessHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfor: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            sucessHandler?()
        }
    }
}
