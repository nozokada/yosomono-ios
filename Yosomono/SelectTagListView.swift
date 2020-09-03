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
    
    var tags: [String]
    var fontSize: CGFloat = 12
    
    @Binding var selectedTags: Set<String>

    func makeUIView(context: Context) -> TagListView {
        let tagListView = TagListView()
        initView(view: tagListView)
        tagListView.delegate = context.coordinator
        return tagListView
    }
    
    func updateUIView(_ uiView: TagListView, context: Context) {
        initView(view: uiView)
    }
    
    func makeCoordinator() -> SelectTagListViewCoordinator {
        return SelectTagListViewCoordinator(parent: self)
    }
    
    fileprivate func initView(view: TagListView) {
        view.removeAllTags()
        tags.forEach() { tag in
            let tagView = view.addTag(tag)
            if selectedTags.contains(tag) {
                tagView.isSelected = true
            }
        }
        view.textFont = UIFont.systemFont(ofSize: fontSize)
        view.textColor = UIColor(Constants.Colors.themeBlue)
        view.selectedTextColor = .white
        view.tagBackgroundColor = .clear
        view.tagSelectedBackgroundColor = UIColor(Constants.Colors.themeBlue)
        view.cornerRadius = fontSize
        view.borderWidth = 1
        view.borderColor = UIColor(Constants.Colors.themeBlue)
        view.paddingX = 8
        view.paddingY = 8
        view.marginX = 8
        view.marginY = 8
    }
}

class SelectTagListViewCoordinator: TagListViewDelegate {
    
    var parent: SelectTagListView
    
    init(parent: SelectTagListView) {
        self.parent = parent
    }
    
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        tagView.isSelected = !tagView.isSelected
        
        if tagView.isSelected {
            parent.selectedTags.insert(title)
        } else {
            parent.selectedTags.remove(title)
        }
    }
}

struct SelectTagListView_Previews: PreviewProvider {
    static var previews: some View {
        SelectTagListView(tags: ["Welcome", "to", "TagListView"], selectedTags: .constant(["Welcome"]))
    }
}