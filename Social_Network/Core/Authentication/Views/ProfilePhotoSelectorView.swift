//
//  ProfilePhotoSelectorView.swift
//  Social_Network
//
//  Created by Juan Aguilar on 07/08/22.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var image: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel:AuthViewModel
    
    var body: some View {
        VStack{
            AuthenticationHeaderView(imageName: "photo.fill", firstText: "Before nothing", secondText: "We need that you add a profile photo!")
            
            Button{
                showImagePicker.toggle()
            }label:{
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                        .clipShape(Circle())
                }else{
                    Image(systemName: "person.crop.circle.badge.plus")
                        .resizable()
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage){
                ImagePicker(selectedImage: $image)
            }
            .padding(.top, 74)
            
            if let image = image {
                Button{
                    viewModel.uploadProfileimage(image)
                }label:{
                    Text("Continue")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: 340, height: 50)
                        .foregroundColor(.white)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius:10, x: 0, y: 0)
                .padding(.top, 30)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage(){
        guard let image = image else { return }
        profileImage = Image(uiImage: image)
    }
}

private struct ProfileImageModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemBlue))
            .scaledToFill()
            .frame(width: 180, height: 180)
            
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
