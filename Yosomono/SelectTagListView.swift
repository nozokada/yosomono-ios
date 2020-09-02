//
//  SelectTagListView.swift
//  Yosomono
//
//  Created by Nozomi Okada on 9/2/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import SwiftUI
import TagListView

struct SelectTagListView: UIViewRepresentable {

    func makeUIView(context: Context) -> TagListView {
        let tagListView = TagListView()
        tagListView.delegate = context.coordinator
        return tagListView
    }
    
    func updateUIView(_ uiViewController: TagListView, context: Context) {
    }
    
    func makeCoordinator() -> SelectTagListCoordinator {
        return SelectTagListCoordinator(parent: self)
    }
}

class SelectTagListCoordinator: TagListViewDelegate {
    
    var parent: SelectTagListView
    
    init(parent: SelectTagListView) {
        self.parent = parent
    }
}

struct SelectTagListView_Previews: PreviewProvider {
    static var previews: some View {
        SelectTagListView()
    }
}
