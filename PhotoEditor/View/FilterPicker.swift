//
//  FilterPicker.swift
//  PhotoEditor
//
//  Created by Neto Lobo on 12/11/23.
//

import SwiftUI

struct FilterPicker: View {
    @Binding var viewModel: PhotoEditorViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(viewModel.filterList, id: \.rawValue) { filter in
                    FilterPickerItem(
                        filterName: filter.rawValue,
                        filteredImage: filter.filterImage(viewModel.originalImage)
                    ) {
                        
                        withAnimation(.spring(duration: 1, bounce: 0.5)) {
                            viewModel.aplyingFilter = true
                            
                            if filter != FiltersList.Original {
                                viewModel.showSaveButton = true
                            } else {
                                viewModel.showSaveButton = false
                            }
                        }
                        
                      
                        viewModel.applyFilter(selectedFilter: filter.selectedFilter)
                        
                    }
                }
            }
        }
        .padding(.horizontal, 10)
    }
}


#Preview(Constants.lightMode, traits: .sizeThatFitsLayout) {
    FilterPicker(viewModel: .constant(PhotoEditorViewModel()))
        .padding()
}

#Preview(Constants.darkMode, traits: .sizeThatFitsLayout) {
    FilterPicker(viewModel: .constant(PhotoEditorViewModel()))
        .preferredColorScheme(.dark)
        .padding()
}
