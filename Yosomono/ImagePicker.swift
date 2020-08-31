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
    
    typealias UIViewControllerType = ImagePickerController
    typealias Coordinator = ImagePickerCoordinator
    
    func makeUIViewController(context: Context) -> ImagePickerController {
        let imagePicker = ImagePickerController()
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: ImagePickerController, context: Context) {
    }
    
    public func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator()
    }
}

class ImagePickerCoordinator: NSObject, ImagePickerDelegate {
    
    override init() {
        
    }
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        
    }
}
