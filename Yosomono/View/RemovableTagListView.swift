//
//  RemovableTagListView.swift
//  Yosomono
//
//  Created by Nozomi Okada on 9/5/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import SwiftUI
import TagListView

struct RemovableTagListView: UIViewRepresentable {
    
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var tags: Set<String>
    
    var fontSize: CGFloat = 16
    
    func makeUIView(context: Context) -> TagListView {
        let tagListView = TagListView()
        tagListView.enableRemoveButton = true
        initView(view: tagListView)
        tagListView.delegate = context.coordinator
        return tagListView
    }
    
    func updateUIView(_ view: TagListView, context: Context) {
        view.removeAllTags()
        view.addTags(Array(tags).sorted())
    }
    
    func makeCoordinator() -> RemovableTagListViewCoordinator {
        return RemovableTagListViewCoordinator(parent: self)
    }
    
    fileprivate func initView(view: TagListView) {
        view.textFont = UIFont.systemFont(ofSize: fontSize)
        view.textColor = .black
        view.removeIconLineColor = .gray
        view.tagBackgroundColor = colorScheme == .dark
            ? UIColor(Constants.Colors.textFieldBackgroundDark)
            : UIColor(Constants.Colors.textFieldBackground)
        view.cornerRadius = fontSize
        view.paddingX = fontSize / 2
        view.paddingY = fontSize / 2
        view.marginX = fontSize / 2
        view.marginY = fontSize / 2
    }
}

class RemovableTagListViewCoordinator: TagListViewDelegate {
    
    var parent: RemovableTagListView
    
    init(parent: RemovableTagListView) {
        self.parent = parent
    }
    
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        sender.removeTagView(tagView)
        parent.tags.remove(title)
    }
}

struct RemovableTagListView_Previews: PreviewProvider {
    static var previews: some View {
        RemovableTagListView(tags: .constant(["Welcome", "to", "Removable", "TagListView"]))
    }
}
