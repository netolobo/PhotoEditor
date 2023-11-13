//
//  PickerButton.swift
//  PhotoEditor
//
//  Created by Neto Lobo on 12/11/23.
//

import SwiftUI

struct ImagePickerButton: View {
    let iconName : String
    let click: () -> Void

    var body: some View {
        Button {
            click()
        } label: {
            Image(systemName: iconName)
                .frame(width: 60, height: 60)
                .font(.title)
                .foregroundColor(.primary)
                .background(.regularMaterial)
                .clipShape(Circle())
        }
    }
}

#Preview(Constants.lightMode, traits: .sizeThatFitsLayout) {
    ImagePickerButton(iconName: Constants.cameraIcon, click: {})
}

#Preview(Constants.lightMode, traits: .sizeThatFitsLayout) {
    ImagePickerButton(iconName: Constants.cameraIcon, click: {})
        .preferredColorScheme(.dark)
}
