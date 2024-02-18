//
//  photoframeApp.swift
//  photoframe
//
//  Created by dgsw8th71 on 2/18/24.
//

import SwiftUI
import SwiftData

@main
struct photoframeApp: App {
    
    private var photoVm = PhotoVM()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(photoVm)
        }
        WindowGroup(id: "PhotoFrame1") {
            PhotoFrameView(image: photoVm.selectedImage)
        }
        .windowResizability(.contentSize)
        .windowStyle(.plain)
    }
}
