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
                .frame(width: 80, height: 80)
                .font(.largeTitle)
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
