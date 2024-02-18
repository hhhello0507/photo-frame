//
//  PhotoFrameView.swift
//  photoframe
//
//  Created by dgsw8th71 on 2/18/24.
//

import SwiftUI
import UIKit
import RealityKit
import RealityKitContent

struct PhotoFrameView: View {
    
    var image: UIImage
    
    var body: some View {
        
        var imageSize = image.size
        //        var resizedImageSize = CGSize(width: imageSize.width / 2, height: imageSize.height / 2)
        
        Image(uiImage: image)
            .resizable()
            .frame(width: imageSize.width / 2, height: imageSize.height / 2)
        
    }
}
