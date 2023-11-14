//
//  SaveImage.swift
//  PhotoEditor
//
//  Created by Neto Lobo on 09/11/23.
//

import Foundation
import UIKit

extension UIImage {
    func save(withCompletionHandler: @escaping (String) -> Void) {
        let imageSaver = ImageSaver()
        
        imageSaver.sucessHandler = {
            withCompletionHandler(Constants.imageSavedSuccessMessage)
        }
        
        imageSaver.errorHandler =  {
            withCompletionHandler("\(Constants.imageSavedErrorMessage) \($0.localizedDescription)")
        }
        
        imageSaver.writeToPhotoAlbum(image: self)
        
    }
}
