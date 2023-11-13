//
//  FilterPickerItem.swift
//  PhotoEditor
//
//  Created by Neto Lobo on 12/11/23.
//

import SwiftUI

struct FilterPickerItem: View {
    var filterName: String
    var filteredImage: UIImage?
    var click: () -> Void
    
    var body: some View {
        Button {
            click()
        } label: {
            VStack {
                Text(filterName)
                    .foregroundColor(.primary)
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .cornerRadius(25)
                    .padding([.horizontal, .top], 5)
                
                if let image = filteredImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 80)
                        .background(.ultraThinMaterial)
                        .clipped()
                } else {
                    ProgressView()
                        .frame(width: 140, height: 80)
                }
                
            }
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 25))
        }
    }
}

#Preview(Constants.lightMode, traits: .sizeThatFitsLayout) {
    FilterPickerItem(
        filterName: "Brazil",
        filteredImage: Constants.defaultImage,
        click: {}
    )
    .padding()
}

#Preview(Constants.darkMode, traits: .sizeThatFitsLayout) {
    FilterPickerItem(
        filterName: "Brazil",
        filteredImage: Constants.defaultImage,
        click: {}
    )
    .preferredColorScheme(.dark)
    .padding()
}
