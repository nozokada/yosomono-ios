//
//  CameraView.swift
//  Yosomono
//
//  Created by Nozomi Okada on 8/30/20.
//  Copyright © 2020 Nozomi Okada. All rights reserved.
//

import SwiftUI

struct CameraView: View {
    
    @Binding var isPresented: Bool
    @Binding var image: UIImage?
    
    var body: some View {
        ImagePicker()
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView(isPresented: .constant(true), image: .constant(nil))
    }
}
