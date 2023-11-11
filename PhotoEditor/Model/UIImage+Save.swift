//
//  SaveImage.swift
//  PhotoEditor
//
//  Created by Neto Lobo on 09/11/23.
//

import Foundation
import UIKit

extension UIImage {
    func save() {
        UIImageWriteToSavedPhotosAlbum(self, nil, nil, nil)
    }
}
