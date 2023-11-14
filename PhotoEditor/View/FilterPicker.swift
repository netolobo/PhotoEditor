//
//  FilterPicker.swift
//  PhotoEditor
//
//  Created by Neto Lobo on 12/11/23.
//

import SwiftUI

struct FilterPicker: View {
    @Binding var viewModel: PhotoEditorViewModel
    var isLandscape: Bool
    
    var orientation : Axis.Set  {
        return self.isLandscape ? .vertical : .horizontal
    }
    
    var body: some View {
        let layout = isLandscape ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
        
        ScrollView(orientation, showsIndicators: false) {
            layout {
                ForEach(viewModel.filters, id: \.rawValue) { filter in
                    FilterPickerItem(
                        filterName: filter.rawValue,
                        filteredImage: filter.filterImage(viewModel.originalImage)
                    ) {
                        withAnimation(.spring(duration: 1, bounce: 0.5)) {
                            viewModel.applyingFilter = true
                            
                            if filter != Filter.Original {
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
    }
}


#Preview(Constants.lightMode, traits: .sizeThatFitsLayout) {
    FilterPicker(viewModel: .constant(PhotoEditorViewModel()), isLandscape: false)
        .previewInterfaceOrientation(.portrait)
        .padding()
}

#Preview(Constants.darkMode, traits: .sizeThatFitsLayout) {
    FilterPicker(viewModel: .constant(PhotoEditorViewModel()), isLandscape: true)
        .preferredColorScheme(.dark)
        .previewInterfaceOrientation(.portrait)
        .padding()
}

