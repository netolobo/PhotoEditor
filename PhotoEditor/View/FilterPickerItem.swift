//
//  FilterPickerItem.swift
//  PhotoEditor
//
//  Created by Neto Lobo on 12/11/23.
//

import SwiftUI

struct FilterPickerItem: View {
    var image: UIImage
    var filter: FiltersList
    
    var click: () -> Void
    
    var body: some View {
        Button {
            click()
        } label: {
            VStack {
                Text(filter.rawValue)
                    .foregroundColor(.primary)
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .cornerRadius(25)
                    .padding([.horizontal, .top], 5)
                
                
                Image(uiImage: filter.filterImage(image: image))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 140, height: 100)
                    .background(.ultraThinMaterial)
                    .clipped()
            }
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 25))
        }
    }
}

#Preview(Constants.lightMode, traits: .sizeThatFitsLayout) {
    FilterPickerItem(
        image: Constants.defaultImage,
        filter: FiltersList.Brazil,
        click: {}
    )
    .padding()
}

#Preview(Constants.darkMode, traits: .sizeThatFitsLayout) {
    FilterPickerItem(
        image: Constants.defaultImage,
        filter: FiltersList.Brazil,
        click: {}
    )
    .preferredColorScheme(.dark)
    .padding()
}
