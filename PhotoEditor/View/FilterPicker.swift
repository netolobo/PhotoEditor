//
//  FilterPicker.swift
//  PhotoEditor
//
//  Created by Neto Lobo on 12/11/23.
//

import SwiftUI

struct FilterPicker: View {
    @State var viewModel: PhotoEditorViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.filterList, id: \.rawValue) { filter in
                    FilterPickerItem(
                        image: viewModel.originalImage,
                        filter: filter
                    ) {
                        viewModel.applyFilter(selectedFilter: filter.selectedFilter)
                    }
                }
            }
        }
        .padding(.horizontal, 10)
    }
}


#Preview(Constants.lightMode, traits: .sizeThatFitsLayout) {
    FilterPicker(viewModel: PhotoEditorViewModel())
}

#Preview(Constants.darkMode, traits: .sizeThatFitsLayout) {
    FilterPicker(viewModel: PhotoEditorViewModel())
        .preferredColorScheme(.dark)
}
