//
//  CameraView.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/30/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import SwiftUI

struct CameraView: View {

    @Binding var images: [UIImage]
    @Binding var isPresented: Bool

    var body: some View {
        ImagePicker(images: $images, isPresented: $isPresented)
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView(images: .constant([UIImage]()), isPresented: .constant(true))
    }
}
