//
//  ContentView.swift
//  photoframe
//
//  Created by dgsw8th71 on 2/18/24.
//

import SwiftUI
import RealityKit
import RealityKitContent
import PhotosUI

struct HomeView: View {
    
    @Environment(\.openWindow) var openWindow
    @Environment(PhotoVM.self) var photoVM
    @State private var image = UIImage()
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    var profileConfig: PHPickerConfiguration {
        
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 1
        config.preferredAssetRepresentationMode = .current
        return config
    }
    
    var mediaConfig: PHPickerConfiguration {
        
        var config = PHPickerConfiguration()
        config.filter = .any(of: [.images, .videos])
        config.selectionLimit = 1
        config.preferredAssetRepresentationMode = .current
        return config
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Button {
                        openWindow(id: "PhotoFrame1")
                    } label: {
                        Text("open window")
                    }
                    Button {
                        showImagePicker.toggle()
                    } label: {
                        Text("select Image")
                    }
                    if profileImage != nil {
                        
                        profileImage?
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                            .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    }
                    else {
                        
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .foregroundColor(Color("AccentColor"))
                            .frame(width: 100, height: 100)
                    }
                }
                .padding()
            }
            .sheet(isPresented: $showImagePicker) {
                loadImage()
            } content: {
                ImagePicker(configuration: profileConfig, selectedImage: $selectedImage, showImagePicker: $showImagePicker)
            }
            .onChange(of: selectedImage) { _, _ in
                loadImage()
            }
        }
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        
        photoVM.selectedImage = selectedImage
        profileImage = Image(uiImage: selectedImage)
    }
}
