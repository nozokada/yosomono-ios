//
//  ImagePickerCamera.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/30/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import SwiftUI

struct ImagePickerCamera: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.modalPresentationStyle = .fullScreen

        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}
