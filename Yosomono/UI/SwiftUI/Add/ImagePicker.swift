//
//  ImagePicker.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/30/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import SwiftUI
import ImagePicker

struct ImagePicker: UIViewControllerRepresentable {

    @Binding var images: [UIImage]
    @Binding var isPresented: Bool

    typealias UIViewControllerType = ImagePickerController
    typealias Coordinator = ImagePickerCoordinator

    func makeUIViewController(context: Context) -> ImagePickerController {
        let imagePicker = ImagePickerController()
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: ImagePickerController, context: Context) {
    }

    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(parent: self)
    }
}

class ImagePickerCoordinator: NSObject, ImagePickerDelegate {

    var parent: ImagePicker

    init(parent: ImagePicker) {
        self.parent = parent
    }

    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        parent.images = images
        print("wrapperDidPress")
    }

    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        parent.images = images
        parent.isPresented = false
        print("doneButtonDidPress")
    }

    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        parent.isPresented = false
        print("cancelButtonDidPress")
    }
}
